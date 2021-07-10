-- 1
create or replace procedure add_employee 
(name text, address text, phone text, email text, salary integer, join_date_text text, in_category text, areas text[])
as $$ 
declare 
    employee_id integer;
    area text;
    join_date date;
    category text;
begin
    SET CONSTRAINTS isa_employee DEFERRED;
    SET CONSTRAINTS check_instructor_trigger DEFERRED;

    join_date := TO_DATE(join_date_text, 'DD/MM/YYYY');
    category := lower(in_category);
    
    if category = 'manager' then
        insert into employees(name, phone, email, join_date, address, depart_date)
            values (name, phone, email, join_date, address, null) returning eid into employee_id;
        insert into Full_Time_Emp values(employee_id, salary);
        insert into managers values(employee_id);
        if areas is not null then
            foreach area in array areas loop
                insert into Course_areas values (area, employee_id);
            end loop;
        end if;

    elsif category = 'administrator' then
        if areas is not null then
            raise exception 'the areas must be empty';
        end if; 
        insert into employees(name, phone, email, join_date, address, depart_date)
            values (name, phone, email, join_date, address, null) returning eid into employee_id;
        insert into Full_Time_Emp values(employee_id, salary);
        insert into Administrators values(employee_id);

    elsif category = 'instructor' then
        if areas is null then
            raise exception 'each instructor must specilise at least one area';
        else
            insert into employees(name, phone, email, join_date, address, depart_date)
                values (name, phone, email, join_date, address, null) returning eid into employee_id;
            insert into Instructors values(employee_id);
            foreach area in array areas loop
                insert into Specializes values(employee_id, area);
            end loop;
        end if;

        if salary > 1000 then
            insert into Full_Time_Emp values(employee_id, salary);
            insert into Full_Time_Instructors values(employee_id);
        else 
            insert into Part_Time_Emp values(employee_id, salary);
            insert into Part_Time_Instructors values(employee_id);
        end if;
    else
        raise exception 'each employee must be either a manager, an administrator or an instructor';
    end if;
end; 
$$ language plpgsql;

-- 2
CREATE OR REPLACE PROCEDURE remove_employee(r_eid integer, departure_date text)
AS $$
DECLARE
    ddepart_date date := TO_DATE(departure_date, 'DD/MM/YYYY');
    is_admin integer;
    is_manager integer;
    is_instructor integer;
    is_part_time_instructor integer := 0;
    curs CURSOR for (select * from sessions where eid = r_eid);
    instructor_can_remove integer := 0;
    can_remove integer := 0;
    r record;
BEGIN
    select eid into is_admin 
    FROM Administrators 
    WHERE eid = r_eid and (not exists (select eid from Offerings O where O.eid = r_eid) or 
            ddepart_date < ALL(SELECT registration_deadline
                            FROM Offerings
                            WHERE eid = r_eid and registration_deadline >= CURRENT_DATE));
    select eid into is_manager 
    FROM Managers 
    WHERE r_eid = eid and NOT EXISTS(SELECT CA.eid
                                    FROM Course_areas CA
                                    WHERE CA.eid = r_eid) ;
    
    select eid into is_instructor -- dc if depart date is null or not
    FROM Instructors 
    WHERE eid = r_eid and ddepart_date > ALL(SELECT s_date
                            FROM Sessions S
                            WHERE S.eid = r_eid) ;
    
    select count(S.eid) into instructor_can_remove -- if null that means can remove
    from Instructors natural join Sessions S
    where S.eid = r_eid; 
    
    IF (is_admin is null and is_instructor is null and is_manager is null) THEN
        raise notice 'cannot leave!'; -- does not fulfil cond to leave!
    ELSE
        IF (is_admin != -1) THEN
            UPDATE Offerings 
            SET eid = (select A.eid from Administrators A natural join Employees E where E.depart_date is not null limit 1)
            WHERE eid = r_eid;

            UPDATE Employees SET depart_date = ddepart_date WHERE eid = r_eid;
            DELETE FROM Administrators WHERE eid = r_eid;
            raise notice 'admin removed and somebody has replaced him if he was managing some offering';
        ELSIF (is_manager != -1) THEN
        -- no need to delete from course_areas bc it shld already be deleted
            UPDATE Employees SET depart_date = ddepart_date WHERE eid = r_eid;
            DELETE FROM Managers WHERE eid = r_eid;
            raise notice 'manager removed';
        ELSIF (instructor_can_remove = 0) THEN
            UPDATE Employees SET depart_date = ddepart_date WHERE eid = r_eid;
            SELECT eid INTO is_part_time_instructor FROM Part_Time_Instructors WHERE eid = r_eid;
            IF (is_part_time_instructor != -1) THEN 
                DELETE FROM Part_Time_Instructors WHERE eid = r_eid; 
            ELSE 
                DELETE FROM Full_Time_Instructors WHERE eid = r_eid;
            end if;
            DELETE FROM Instructors WHERE eid = r_eid;
            raise notice 'instructor removed bc he is not teaching any sessions';
        ELSE -- is instructor but cannot remove 
            open curs;
            loop
                fetch curs into r;
                exit when not found;

                if (select count(eid) from find_instructor(r.course_id, to_char(r.s_date, 'DD/MM/YYYY'), r.start_time::time)) = 0 then
                raise notice '%', r;
                    raise notice 'instructor cannot be removed because no available instructor to replace at least one session';
                else
                    raise notice 'update instructor for the following sessions after removing instructor' ;
                    raise notice 'course_id: %' , (r.course_id);
                    raise notice 'session date: %' , (r.s_date);
                    raise notice 'start_time: %' , (r.start_time);
                    can_remove := can_remove + 1;
                end if;
            end loop;
            close curs;
            if (can_remove = (select count(*) from sessions where eid = r_eid) and can_remove != 0) then
                raise notice '1st time checking: instructor can be removed if you update all the mentioned sessions'; 
            end if;
        end if;
    end if;
END;
$$ LANGUAGE plpgsql;

-- 3
CREATE OR REPLACE PROCEDURE add_customer(cust_name text, cust_email text, cust_address text, cust_phone text,
                                        cc_num integer, CVV integer, expiry_date char)
AS $$ 
DECLARE 
    next_id integer;
BEGIN
    INSERT INTO Customers(cust_name, cust_email, cust_address, cust_phone)
        VALUES(cust_name, cust_email, cust_address, cust_phone) returning cust_id into next_id;

    INSERT INTO Credit_cards(cc_number, cust_id, CVV, expiry_date, from_date)
        VALUES(cc_num, next_id, CVV, expiry_date, CURRENT_DATE);
END
$$ LANGUAGE plpgsql;

-- 4
CREATE OR REPLACE PROCEDURE update_credit_card (cid INT, cc_no INT, expiry CHAR(7), CVV_code CHAR(3))
AS $$
BEGIN
    UPDATE Credit_cards
    SET cc_number = cc_no, expiry_date = expiry, CVV = CVV_code, from_date = CURRENT_DATE
	WHERE cust_id = cid;
END;
$$ LANGUAGE plpgsql;

-- 5
create or replace procedure add_course (title text, description text, course_area text, duration integer)
as $$
BEGIN
    insert into Courses(duration, description, title, course_area)
    values (duration, description, title, course_area);
end;
$$ language plpgsql;

-- 6
CREATE OR REPLACE FUNCTION find_instructor(cid integer, ses_date text, sess_start time)
RETURNS TABLE(eid integer, name text) AS $$
DECLARE 
    earliest_start_time time := sess_start - interval '1:00:00';
    course_duration interval ;
    latest_end_time time := sess_start + interval '1:00:00' ;
    sess_start_date date := TO_DATE(ses_date, 'DD/MM/YYYY');
BEGIN
select sum(duration) into course_duration from Courses where course_id = cid;
    return query (
        with all_instructors AS (
        SELECT distinct I.eid, E.name -- only instructors that specialize in the same area as course_id n name
        FROM Instructors I natural join Employees E
        WHERE cid in (SELECT course_id 
                            FROM Specializes S, Courses C
                            WHERE S.ca_name = C.course_area and S.eid = I.eid) and depart_date is null
        ), temp AS (
            -- instructors unavailable to teach on that day
            (SELECT SS.eid, A.name, SS.start_time, SS.end_time 
            FROM Sessions SS natural join all_instructors A 
            WHERE SS.s_date = sess_start_date and (SS.end_time > earliest_start_time )
            union
            SELECT SS.eid, A.name, SS.start_time, SS.end_time 
            FROM Sessions SS natural join all_instructors A 
            WHERE SS.s_date = sess_start_date and (SS.start_time < latest_end_time + course_duration)
            )
        ), teaching_hours AS (
            SELECT S.eid, sum(end_time - start_time)
            FROM Sessions S
            WHERE extract(MONTH from s_date) = extract(MONTH from sess_start_date) and extract(YEAR from s_date) = extract(YEAR from sess_start_date)
            GROUP BY S.eid
        )
        select A.eid, A.name -- 
        from all_instructors A natural join Sessions S
        where A.eid in (select t.eid from teaching_hours t where t.sum + course_duration <= '30:00:00'::interval) or 
        not exists (select t.eid from teaching_hours t where t.eid = A.eid)
        except 
        select T.eid, t.name
        from temp T
    );
END;
$$ LANGUAGE plpgsql;

-- 7
CREATE OR REPLACE FUNCTION get_available_instructors(cid int, s_date text, e_date text) 
returns table(eid int, name text, total_hours interval, curr_date date, hr time[]) as $$
declare 
    sd date := TO_DATE(s_date, 'DD-MM-YYYY');
    ed date := TO_DATE(e_date, 'DD-MM-YYYY');
    cd date;
    curs refcursor;
    i record;
    workHrs time[];
    have_overlap int:= 0;
    availHrs time[];
    t time;
begin
    create temp table InstructorSpecialiseInArea as 
    with t as( 
        select S.eid
        from Specializes S, Courses C
        where C.course_id = cid
        and S.ca_name = C.course_area)
    select * from t;
    -- 24, 37

    create temp table InstructorSession as
    with t as (
        select IA.eid, S.s_date as teaching_date, S.start_time, S.end_time
        from InstructorSpecialiseInArea IA, Sessions S
        where IA.eid = S.eid
        and (date_part('month', S.s_date) = date_part('month', sd) or date_part('month', S.s_date) = date_part('month', ed))
        )
    select * from t;
    
    create temp table TotalTeachingHours as 
    with t as (
        select IA.eid, sum(S.end_time - S.start_time) as total_teaching_hour
        from InstructorSpecialiseInArea IA, Sessions S
        where IA.eid = S.eid
        and (date_part('month', S.s_date) = date_part('month', sd) or date_part('month', S.s_date) = date_part('month', ed))
        group by IA.eid
        )
    select * from t;

    open curs for SELECT * FROM InstructorSpecialiseInArea;
    loop
        FETCH curs into i;
        exit when not found; 
        cd := sd;
        loop 
            exit when cd > ed;
            -- iterate through working hrs to check availability 
            workHrs := array [TIME '09:00', TIME '10:00', TIME '11:00',TIME '14:00',TIME '15:00',TIME '16:00',TIME '17:00']; 
            FOREACH t in array workHrs
            loop
                SELECT 1 into have_overlap from InstructorSession K 
                    WHERE t >= (K.start_time - interval '1 hour') AND t < (K.end_time + interval '1 hour') 
                    AND K.teaching_date = cd AND K.eid = i.eid;
                IF count(have_overlap) = 0 THEN 
                    availHrs := availHrs || array[t];
                END IF;
            end loop; 
            -- adding into return table 
            eid := i.eid;
            name := (SELECT E.name from Employees E where e.eid = i.eid);
            total_hours := COALESCE((SELECT total_teaching_hour FROM TotalTeachingHours T WHERE T.eid = i.eid),interval '0 hour');
            curr_date := cd;
            hr := availHrs;
            RETURN NEXT;
            -- reset variables
            availHrs := array[]::time[];
            cd := cd + interval '1 day';
        end loop;
    end loop;
    close curs;  

    drop table if exists InstructorSpecialiseInArea, InstructorSession, TotalTeachingHours;

end;
$$ language plpgsql;

-- 8
CREATE OR REPLACE FUNCTION find_rooms (sdate TEXT, s_start TIME, duration interval)
RETURNS TABLE(rid INT) AS $$
DECLARE
	p_end_time TIME;
    s_date_t DATE := TO_DATE(sdate, 'DD/MM/YYYY');

BEGIN
	p_end_time := s_start + duration;

    RETURN QUERY (SELECT Rooms.rid FROM Rooms except
    SELECT S.rid FROM Sessions S
    WHERE S.s_date = s_date_t AND ((S.start_time < p_end_time) AND (S.end_time > s_start))
    ORDER BY rid ASC);

    RETURN;
END;
$$ LANGUAGE plpgsql;

-- 9
CREATE OR REPLACE FUNCTION get_available_rooms(start_date text, end_date text) 
RETURNS TABLE (room_id int, capacity int, a_date date, hour time[]) AS $$
DECLARE 
    curs CURSOR FOR (SELECT * FROM Rooms);
    r record;
    start_date_m date := TO_DATE(start_date,'DD/MM/YYYY');
    c_date date := TO_DATE(start_date, 'DD/MM/YYYY');
    end_date_m date := TO_DATE(end_date, 'DD/MM/YYYY');
    w_hour time[];
    c_availhr time[];
    have_overlap integer := 0; 
    t time; 

BEGIN 
    OPEN curs;
    loop 
        fetch curs into r; 
        exit when not found;
        c_date := start_date_m;
        loop 
            exit when c_date > end_date_m;
            w_hour := array [TIME '09:00', TIME '10:00', TIME '11:00',TIME '14:00',TIME '15:00',TIME '16:00',TIME '17:00'];
            FOREACH t in array w_hour 
            loop
                with c_sess as (SELECT * FROM Sessions S WHERE S.s_date = c_date AND S.rid = r.rid)
                select 1 into have_overlap from c_sess L where t >= L.start_time AND t < L.end_time;
                if count(have_overlap) = 0 then 
                    c_availhr := c_availhr || array[t];
                else 
                    have_overlap := 0;
                end if; 
            end loop;
            room_id := r.rid;
            capacity := r.seating_capacity;
            a_date := c_date;
            hour := c_availhr;
            RETURN NEXT;
            c_date := c_date + interval '1 day';
            c_availhr := array[]::TIME[];
        end loop;
    end loop;
    close curs;
END;
$$ LANGUAGE plpgsql;

--10
create or replace procedure add_course_offering 
(in_course_id integer, in_fees numeric, in_launch_date_text text, in_registration_deadline_text text, in_target_number_registrations integer, in_aid integer, in_s_date text[], in_s_start_time time without time zone[], in_rid integer[])
as $$
declare
    cid integer;
    ins_eid_arr integer[];
    ins_eid integer;
    num_session integer;
    num_start_time integer;
    num_room integer;
    course_duration integer;
    total_seating_capacity integer := 0;
    in_launch_date date;
    in_registration_deadline date;
    inserted_offering offerings%rowtype;
begin
    -- check if the admin is valid
    if (select eid from Administrators A where A.eid = in_aid) is null then
        raise exception 'Administrator id is invalid';
    end if;

    select C.course_id into cid
    from Courses C
    where C.course_id = in_course_id;

    -- check if the session info is valid
    num_session := array_length(in_s_date, 1);
    num_start_time := array_length(in_s_start_time, 1);
    num_room := array_length(in_rid, 1);

    if num_session <> num_start_time or num_start_time <> num_room or num_session <> num_room then
        raise exception 'session info must have the same number of items';
    end if;
    -- course offering valid: the course exists?
    if cid is not null then
        -- check seating capacity before add offering
        for i in 1..num_room loop
            total_seating_capacity := total_seating_capacity + (select seating_capacity from Rooms R where R.rid = in_rid[i]);
        end loop;

        in_launch_date := TO_DATE(in_launch_date_text, 'DD/MM/YYYY');
        in_registration_deadline := TO_DATE(in_registration_deadline_text, 'DD/MM/YYYY');

        if total_seating_capacity >= in_target_number_registrations then
            course_duration := (select duration from Courses C where C.course_id = in_course_id);
            for i in 1..num_session loop
                ins_eid := (select eid from find_instructor(cid, in_s_date[i], in_s_start_time[i]) limit 1); -- assign the first one?
                if ins_eid is not null then
                    ins_eid_arr := (select * from array_append(ins_eid_arr, ins_eid));
                else  
                    raise exception 'no available instructor';
                end if;
            end loop;

            insert into offerings 
            values (in_launch_date, TO_DATE(in_s_date[1], 'DD/MM/YYYY') , TO_DATE(in_s_date[num_session], 'DD/MM/YYYY') , in_registration_deadline, in_target_number_registrations, total_seating_capacity, in_fees, cid, in_aid)
            returning * into inserted_offering;
            
            if inserted_offering is null then
                raise exception 'course offering insertion failed';
            else
                -- assign instructors for the sessions
                for i in 1..num_session loop
                    insert into Sessions
                    values(in_course_id, in_launch_date, i, in_s_start_time[i], in_s_start_time[i] + (course_duration || 'hour')::interval, TO_DATE(in_s_date[i], 'DD/MM/YYYY'), in_rid[i], ins_eid_arr[i]);
                end loop;
            end if;
        else
            raise exception 'total seating capacity % must be at least equal to target number of registration % ', total_seating_capacity, in_target_number_registrations;
        end if;
    else
        raise exception 'the course does not exist';
    end if;   
end;
$$ language plpgsql;

-- 11
create or replace procedure add_course_package
(name text, num_free_registrations integer, sale_start_date text, sale_end_date text, price numeric)
as $$
declare 
    sale_start_date_m date := TO_DATE(sale_start_date, 'DD/MM/YYYY');
    sale_end_date_m date := TO_DATE(sale_end_date, 'DD/MM/YYYY');
begin
    insert into Course_packages(sale_start_date,sale_end_date,num_free_registrations,name,price)
    values (sale_start_date_m, sale_end_date_m, num_free_registrations, name, price);
end;
$$ language plpgsql;

-- 12
CREATE OR REPLACE FUNCTION get_available_course_packages()
RETURNS TABLE(name text, num_free_registrations integer, sale_end_date date, price numeric) AS $$ --pck_name, num_free_sess, promo_end_date, price
DECLARE 
    today_date date := CURRENT_DATE;
BEGIN
    return query(
    select C.name, C.num_free_registrations, C.sale_end_date, C.price
    FROM Course_packages C
    WHERE today_date >= C.sale_start_date and today_date <= C.sale_end_date
    );
END;
$$ LANGUAGE plpgsql;

-- 13
CREATE OR REPLACE PROCEDURE buy_course_package (c_id INT, cp_id INT)
AS $$
DECLARE 
	cc_no INTEGER;
	no_packages INTEGER;
BEGIN
	SELECT cc_number INTO cc_no
	FROM Credit_Cards
	WHERE cust_id = c_id;

	SELECT num_free_registrations INTO no_packages
	FROM Course_packages
	WHERE package_id = cp_id;

	IF (COUNT(cc_no) >= 1 AND COUNT(no_packages) >= 1) THEN
		INSERT INTO Buys (b_date, num_remaining_redemptions, package_id, cc_number, cust_id)
		VALUES (CURRENT_DATE, no_packages, cp_id, cc_no, c_id);
	END IF;
END;
$$ LANGUAGE plpgsql;

-- 14
CREATE OR REPLACE FUNCTION get_my_course_package(cid integer)
returns json as $$
declare 
    ret_value text[];
    result text[];
    redeem_records text[]; 
    value record; 
    redeems record;
    package record;
    curs CURSOR FOR (SELECT * FROM Redeems R WHERE R.cust_id = cid);
    red record;
    curs2 CURSOR FOR (SELECT C.name, B.b_date, C.num_free_registrations, B.num_remaining_redemptions, C.price, B.package_id
                        FROM Buys B natural join Course_packages C-- on package_id
                        WHERE B.cust_id = cid and (B.num_remaining_redemptions >= 1 or 
                            B.package_id in (select R.package_id
                                        from Redeems R join Sessions S on (R.course_id, R.launch_date, R.sid) = (S.course_id, S.launch_date, S.sid)
                                        where s_date >= CURRENT_DATE + interval '7'))
                        order by package_id);
    begin
    -- to check active or partially active 
    
    open curs2;
    loop
        fetch curs2 into value;
        EXIT when not found;

        Raise notice '%', value;
        ret_value := ret_value || array[value.name]::text;
        ret_value := ret_value || array[value.b_date]::text;
        ret_value := ret_value || array[value.price]::text;
        ret_value := ret_value || array[value.num_free_registrations]::text;
        ret_value := ret_value || array[value.num_remaining_redemptions]::text;

        open curs; 
        loop
            fetch curs into red; 
            EXIT WHEN NOT FOUND; 
            IF red.package_id = value.package_id AND red.b_date = value.b_date THEN 
            redeem_records := redeem_records || array[(SELECT title FROM Courses C WHERE C.course_id = red.course_id)]::text; 
            redeem_records := redeem_records || 
                array[(SELECT s_date FROM Sessions S 
                WHERE S.course_id = red.course_id AND S.launch_date = red.launch_date AND S.sid = red.sid 
                order by S.s_date, S.start_time asc)]::text;
            redeem_records := redeem_records || 
                array[(SELECT start_time FROM Sessions S 
                WHERE S.course_id = red.course_id AND S.launch_date = red.launch_date AND S.sid = red.sid
                order by S.s_date, S.start_time asc)]::text;
            END IF;
        end loop;
        close curs; 
        ret_value := ret_value || redeem_records;
        
        end loop;
        close curs2;
        result := result || ret_value ;

    RETURN (array_to_json(ret_value));
end;
$$ language plpgsql;

-- 15
CREATE OR REPLACE FUNCTION get_available_course_offerings()
RETURNS TABLE(c_name text, startdate date, enddate date, deadline date, fees numeric, rem_seats integer) AS $$
BEGIN 
	RETURN QUERY(
		SELECT (SELECT title FROM Courses C WHERE C.course_id = O.course_id),
		O.start_date as startdate, 
		O.end_date as enddate, 
		O.registration_deadline as deadline, 
		O.fees, 
		(total_seating_capacity - (SELECT count(cust_id) FROM Registers R WHERE R.course_id = O.course_id AND R.launch_date = O.launch_date))::int as rem_seats
	FROM Offerings O
	WHERE (SELECT count(cust_id) FROM Registers R 
            WHERE R.course_id = O.course_id AND R.launch_date = O.launch_date) < O.total_seating_capacity
            AND O.registration_deadline > CURRENT_DATE
	ORDER BY (deadline, c_name) asc);
END;
$$ LANGUAGE plpgsql;

-- 16
CREATE OR REPLACE FUNCTION get_available_course_sessions(cid integer, ld text)
RETURNS TABLE(s_date date, s_start time, i_name text, rem_seats integer) AS $$
DECLARE 
    launchdate date := TO_DATE(ld, 'DD/MM/YYYY');
BEGIN 
	RETURN QUERY 
    (SELECT S.s_date, S.start_time as s_start, 
	(SELECT name FROM Employees E WHERE E.eid = S.eid) as i_name, 
	((SELECT seating_capacity FROM Rooms WHERE Rooms.rid = S.rid) - 
	 (SELECT count(cust_id) FROM Registers R WHERE R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid))::int as rem_seats
	FROM Sessions S 
	WHERE S.course_id = cid AND S.launch_date = launchdate
	AND ((SELECT count(cust_id) FROM Registers R WHERE R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid) 
            < (SELECT seating_capacity FROM Rooms WHERE Rooms.rid = S.rid)));
END;
$$ LANGUAGE plpgsql;

-- 17
create or replace procedure register_session
(in_cust_id integer, in_course_id integer, in_launch_date_text text, in_sid integer, in_payment_method text)
as $$
declare
    c_overlap integer;
    cc_number_var integer := -1;
    buy_var record;
    sid integer := -1;
    in_launch_date date := TO_DATE(in_launch_date_text, 'DD/MM/YYYY');
begin
    in_payment_method := lower(in_payment_method);

    -- check customer is free at the timing
    SELECT count(start_time) INTO c_overlap FROM (Sessions natural join Registers) SR
    WHERE NEW.cust_id = SR.cust_id AND NEW.s_date = SR.s_date AND 
    ((SR.start_time <= NEW.end_time) AND (SR.end_time >= NEW.start_time));

    if c_overlap <> 0 then
      raise exception 'the customer has an overlapping session at that time';
    end if;

    -- check if the session exists
    sid := (select S.sid
        from Sessions S
        where S.course_id = in_course_id
        and S.launch_date= in_launch_date
        and S.sid = in_sid);

    if sid is null then
        raise exception 'invalid session';
    else
        select cc_number into cc_number_var
        from Credit_Cards C
        where C.cust_id = in_cust_id;

        if cc_number_var = -1 then 
            raise exception 'Customer has no credit card';
        else 
            if in_payment_method = 'credit card' then
                insert into registers
                values(in_course_id, in_launch_date, sid, CURRENT_DATE, in_cust_id, cc_number_var);
            elsif in_payment_method = 'redeem' then
                -- query buys 
                select * into buy_var 
                from buys B
                where B.cust_id = in_cust_id
                and B.num_remaining_redemptions > 0;

                if buy_var is null then
                    raise exception 'the customer does not have active package';
                else
                    -- insert into redeems
                    insert into redeems
                    values (CURRENT_DATE, in_sid, in_course_id, in_launch_date, in_cust_id, cc_number_var, buy_var.b_date, buy_var.package_id);
                    -- insert into registers
                    insert into registers
                    values(in_course_id, in_launch_date, in_sid, CURRENT_DATE, in_cust_id, cc_number_var);
                    -- update buys
                    update buys B
                    set num_remaining_redemptions = num_remaining_redemptions - 1
                    where b_date = buy_var.b_date and package_id = buy_var.package_id
                    and cc_number = buy_var.cc_number and cust_id = buy_var.cust_id;
                end if;
            else
                raise exception 'invalid payment method';
            end if;
        end if;
    end if;
end;
$$ language plpgsql;

-- 18
CREATE OR REPLACE FUNCTION get_my_registrations(cid integer) 
RETURNS TABLE (c_name text, course_fees numeric, s_date date, s_start time, s_end time, i_name text) AS $$
BEGIN
	RETURN QUERY (
    SELECT 
	(SELECT title FROM Courses WHERE Courses.course_id = R.course_id) as c_name, 
	(SELECT fees FROM Offerings O WHERE O.course_id = R.course_id and O.launch_date = R.launch_date) as course_fees, 
	(SELECT S.s_date FROM Sessions S WHERE S.course_id = R.course_id AND S.launch_date = R.launch_date AND S.sid = R.sid) as s_date, 
	(SELECT S.start_time FROM Sessions S WHERE S.course_id = R.course_id AND S.launch_date = R.launch_date AND S.sid = R.sid) as s_start,
    (SELECT S.end_time FROM Sessions S WHERE S.course_id = R.course_id AND S.launch_date = R.launch_date AND S.sid = R.sid) as s_end,
    (SELECT (SELECT name FROM Employees E WHERE E.eid = S.eid) FROM Sessions S WHERE S.course_id = R.course_id AND S.launch_date = R.launch_date AND S.sid = R.sid) as i_name
    FROM Registers R 
	WHERE R.cust_id = cid 
		AND current_date < (SELECT registration_deadline FROM Offerings O 
		WHERE (O.course_id = R.course_id AND O.launch_date = R.launch_date))
	ORDER BY (s_date, s_start) asc
        );
END;
$$ LANGUAGE plpgsql;

-- 19
create or replace procedure update_course_session
(in_cust_id integer, in_course_id integer, in_launch_date_text text, in_new_sid integer)
as $$ 
declare 
    new_session record;
    new_session_seating_capacity integer;
    new_session_num_registration integer;
    in_launch_date date;
begin
    in_launch_date := TO_DATE(in_launch_date_text, 'DD/MM/YYYY');
    -- check customer has register for this course
    if (select R.cust_id from Registers R where R.cust_id = in_cust_id and R.course_id = in_course_id) is null then
        raise exception 'the customer has not registered for this course';
    end if;

    -- check register exists
    if exists (
        select 1
        from Registers R
        where R.course_id = in_course_id
        and R.launch_date = in_launch_date
        and R.cust_id = in_cust_id
        and R.sid = in_new_sid
    ) then
        raise exception 'the customer has already registered this session';
    end if;
    
    -- check valid, new session exist
    select * into new_session
    from Sessions S
    where S.course_id = in_course_id
    and S.launch_date = in_launch_date
    and S.sid = in_new_sid;

    if new_session is null then
        raise exception 'invalid new session';
    end if;
    
    -- avaliable seat in the session
    -- check num of registration
    select sum(seating_capacity) into new_session_seating_capacity
    from (Sessions natural join Rooms) SR
    where SR.course_id = in_course_id and SR.launch_date = in_launch_date and SR.sid = in_new_sid;

    select count(*) into new_session_num_registration
    from (Sessions natural join Registers) SRegister
    where SRegister.course_id = in_course_id
    and SRegister.launch_date = in_launch_date;
    
    if new_session_num_registration + 1 <= new_session_seating_capacity then
        update Registers R
        set sid = in_new_sid
        where course_id = in_course_id
        and launch_date = in_launch_date
        and cust_id = in_cust_id;
    else 
        raise exception 'the session is full';
    end if;
end;
$$ language plpgsql;

-- 20
CREATE OR REPLACE PROCEDURE cancel_registration (custId INT, launchDate TEXT, courseId INT)
AS $$
DECLARE 
    l_date DATE := to_date(launchDate, 'DD/MM/YYYY');
    now_date DATE := CURRENT_DATE;
    session_date DATE;
	cancel_by DATE;
    session_no INTEGER = 0;
    pack_id INTEGER = 0;
    creditcard_no INTEGER;
    buy_date DATE;
    refund_amount INTEGER;
    reg_date DATE;
BEGIN
	SELECT R.sid, R.cc_number, R.r_date
    INTO session_no, creditcard_no, reg_date
	FROM Registers R
	WHERE R.cust_id = custId AND R.launch_date = l_date AND R.course_id = courseId;
	
    SELECT S.s_date INTO session_date
    FROM Sessions s
    WHERE S.course_id = courseId AND S.launch_date = l_date AND S.sid = session_no;

    cancel_by := session_date - interval '7 days';

    IF (session_no > 0) THEN
    -- registration exist:
		-- no cancellation since sesison has finished
		IF (now_date > session_date) THEN
			raise notice 'cannot cancel registration because session has ended';
        -- no refund since it did not cancel 7 days before start of session, checked
    	ELSIF (now_date > cancel_by) THEN
    		INSERT INTO Cancels (cust_id, course_id, sid, launch_date, cdate, refund_amt, package_credit)
    		VALUES (custId, courseId, session_no, l_date, now_date, 0, 0);
            -- remove from Registers table, pk: course_id, launch_date, sid, r_date, cust_id, cc_number
            DELETE FROM Registers R
            WHERE R.course_id = courseId AND 
                    R.launch_date = l_date AND 
                    R.sid = session_no AND 
                    R.r_date = reg_date AND 
                    R.cust_id = custId AND 
                    R.cc_number = creditcard_no;
        -- refund accordingly: redemption or refund
    	ELSE
            SELECT R.package_id, R.b_date 
            INTO pack_id, buy_date
            FROM Redeems R
            WHERE R.cust_id = custId AND R.launch_date = l_date AND R.course_id = courseId AND R.sid = session_no AND R.cc_number = creditcard_no;
            -- redeem : refund 1 package credit
            -- default value is 0, so if packId != 0 that means packId exists on the table
            IF (pack_id != 0) THEN
                --pk for Buys: b_date, package_id, cc_number, cust_id (all available from Redeems table)
                UPDATE Buys B
                SET num_remaining_redemptions = num_remaining_redemptions + 1
                WHERE B.cust_id = custId AND B.package_id = pack_id AND B.cc_number = creditcard_no AND B.b_date = buy_date;

                INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date)
    		    VALUES (now_date, 0, 1, custId, session_no, courseId, l_date); 
                raise notice 'registration canceled: +1 package credit';
            ELSE 
                --  pk for Offerings: launch_date, course_id
                SELECT O.fees INTO refund_amount
                FROM Offerings O 
                WHERE O.launch_date = l_date AND O.course_id = courseId;

                refund_amount := ROUND(refund_amount * 0.9);

                INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date)
                VALUES (now_date, refund_amount, 0, custId, session_no, courseId, l_date); 
                raise notice 'registration cancelled: refunded $%', refund_amount;
            END IF;
            -- remove from Registers table, pk: course_id, launch_date, sid, r_date, cust_id, cc_number
            DELETE FROM Registers R
            WHERE R.course_id = courseId AND 
                    R.launch_date = l_date AND 
                    R.sid = session_no AND 
                    R.r_date = reg_date AND 
                    R.cust_id = custId AND 
                    R.cc_number = creditcard_no;
    	END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- 21
create or replace procedure update_instructor(launchdate TEXT, courseId integer, sess_id integer, instructor_id integer)
as $$
declare
    l_date DATE := to_date(launchDate, 'DD/MM/YYYY');
    session_ca text;
    valid_instructor integer := -1;
    not_started integer := -1;
    session_date DATE;
    session_start TIME;
    session_end TIME;
    session_duration interval;
    session_day integer := -1;
    session_break integer := -1;
    inst_type integer := -1;
    total_working_hours interval;
    update_hours interval;
begin
    --for declared vars:
    select C.course_area into session_ca
    from Courses C natural join Sessions S 
    where S.launch_date = l_date AND S.course_id = courseId AND S.sid = sess_id;

    select S.s_date, S.start_time, S.end_time, (S.end_time-S.start_time)
    into session_date, session_start, session_end, session_duration
    from Sessions S 
    where S.launch_date = l_date AND S.course_id = courseId AND S.sid = sess_id;

    -- check if instructor specializes in the same area as course; 1 if same -1 if not same
    select count(*) into valid_instructor from Specializes where ca_name = session_ca and eid = instructor_id;
    -- check if session has not started
    select count(*) into not_started 
    from Sessions S
    where S.course_id = courseId and S.launch_date = l_date and S.sid = sess_id and (S.s_date > CURRENT_DATE or (S.s_date = CURRENT_DATE and S.start_time > CURRENT_TIME));
    --check if instructor dont have class on session date, 1 = have class
    select count(*) into session_day
    from Sessions S
    where S.eid = instructor_id AND S.s_date = session_date; 
    --check when instructor has classes on session launch date
    --if instrutor has 1 hour break before class started
    session_start := session_start - interval '1 hour';
    --if instructor has 1 hour break after class started 
    session_end := session_end + interval '1 hour';
    select count(*) into session_break
    from Sessions S
    where S.eid = instructor_id AND s.s_date = session_date AND (s.end_time <= session_start or s.start_time >= session_end);
   
    --check if instructor is part time, 0 = full time, 1 = part time
    select count(eid) INTO inst_type from Part_time_Instructors PT where PT.eid = instructor_id;

    if valid_instructor > 0 and not_started > 0 and (session_day = 0 or session_break <> 0) then
        if inst_type < 1 then
            --no matter what can update to this full-time instructor 
            update Sessions
            set eid = instructor_id 
            where course_id = courseId AND launch_date = l_date AND sid = sess_id;
            raise notice 'updated to this full-time instructor successfully';
        else 
            --inst is part time, sum total hours for the month
            select sum(end_time - start_time) INTO total_working_hours
            from Sessions
            where date_trunc('month', s_date) = date_trunc('month', session_date) and eid = instructor_id;

            select COALESCE(total_working_hours, interval '0 hour') into total_working_hours;
			update_hours := total_working_hours + session_duration;

            if update_hours < interval '30 hours' then
                update Sessions
                set eid = instructor_id 
                where course_id = courseId AND launch_date = l_date AND sid = sess_id;
                raise notice 'updated to this part-time instructor successfully';
            else
                raise notice 'cannot update to this part-time instructor';
            end if;
        end if; 
    else 
    	raise notice 'instructor cannot be updated'; 
    end if;
end;
$$ language plpgsql;

-- 22
create or replace procedure update_room
(cid integer, ld text, c_sid integer, new_rid integer)
as $$
declare
    launch_date_n date := to_date(ld, 'DD/MM/YYYY');
    sess record;
    sess_date date; 
    sess_start time;
    sess_duration interval;
    sess_end time;
    num_registration integer;
    room record;
    room_busy int;
begin
    select * into sess
    from Sessions S
    where cid = S.course_id and launch_date_n = S.launch_date and c_sid = S.sid;

    sess_date := sess.s_date;
    sess_start := sess.start_time;
    sess_duration := sess.end_time - sess.start_time;
    sess_end := sess.end_time;

    select count(*) into num_registration
    from Registers R
    where cid = R.course_id and launch_date_n = R.launch_date and c_sid = R.sid;

    select * into room
    from Rooms RM
    where new_rid = RM.rid;

    -- finds out if the new_rid is busy between sess_start and sess_end 
    -- if the busy room is new_rid, room_busy = 1 else 0 means free to conduct session
    select count(rid) into room_busy 
    from
        (select rid -- start or end time overlaps with new session
        from Sessions
        where ((start_time >= sess_start and start_time < sess_end) or (end_time > sess_start and end_time <= sess_start)) and s_date = sess_date
        union
        select rid -- any session start time overlaps with new session end time
        from Sessions
        where start_time < sess_end and start_time >= sess_start and s_date = sess_date) as temp
    where rid = new_rid;

    Raise notice '%', (sess.s_date < CURRENT_DATE);
    raise notice '%', room_busy;
    raise notice '%', num_registration;
    -- check if the room is available or not 
    --  and new_rid in (SELECT find_rooms2(sess_date, sess_start, sess_duration)) 
    if sess.s_date > CURRENT_DATE and num_registration <= room.seating_capacity and room_busy = 0 
       then
        update Sessions S
        set rid = new_rid
        where S.course_id = cid and launch_date_n = S.launch_date and c_sid = S.sid;
        raise notice 'updated successfully';
    else
        Raise notice 'Invalid Request';
    end if;
end;
$$ language plpgsql;

--23
CREATE OR REPLACE PROCEDURE remove_session (colaunch TEXT, cid INT, sno INT)
AS $$
DECLARE
    l_date DATE := to_date(colaunch, 'DD/MM/YYYY');
    now_date DATE := date_trunc('day', CURRENT_DATE);
	courseStart DATE;
	countReg INTEGER = 0;
    change_offering INTEGER := 0;
    offering_start DATE;
    offering_end DATE;
    next_start DATE;
    next_end DATE;
    total_sessions INTEGER = 0;
    cancels_check INTEGER = 0;
BEGIN
	SELECT S.s_date INTO courseStart
	FROM Sessions S
	WHERE S.launch_date = l_date AND
		S.course_id = cid AND
		S.sid = sno;

	SELECT count(*) INTO countReg
	FROM Registers R
	WHERE R.course_id = cid AND
		R.launch_date = l_date AND
		R.sid = sno;

    SELECT O.start_date, O.end_date
    INTO offering_start, offering_end
    FROM Offerings O
    WHERE O.course_id = cid AND O.launch_date = l_date;

    SELECT count(*) INTO total_sessions
    FROM Sessions S
    WHERE S.launch_date = l_date AND S.course_id = cid AND S.sid = sno;

    SELECT S.s_date INTO next_start
    FROM Sessions S
    WHERE S.launch_date = l_date AND S.course_id = cid AND S.sid = sno
    ORDER BY s_date ASC
    OFFSET 1
    LIMIT 1;

    SELECT S.s_date INTO next_end
    FROM Sessions S
    WHERE S.launch_date = l_date AND S.course_id = cid AND S.sid = sno
    ORDER BY s_date DESC
    OFFSET 1
    LIMIT 1;

	IF (now_date < courseStart and count(courseStart) != 0 AND countReg < 1) THEN
		DELETE FROM Sessions
		WHERE launch_date = l_date AND course_id = cid AND sid = sno;

        IF (courseStart = offering_start AND total_sessions >= 2) THEN
            UPDATE Offerings
            SET start_date = next_start
            WHERE launch_date = l_date AND course_id = cid;
        END IF;

        IF (courseStart = offering_end AND total_sessions >= 2) THEN
            UPDATE Offerings
            SET end_date = next_end
            WHERE launch_date = l_date AND course_id = cid;
        END IF;
    ELSE
        raise notice 'this session cannot be deleted';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- 24
create or replace procedure add_session
(cid integer, ld text, new_sid integer, sd text, startHour time, eid integer, new_rid integer)
as $$
declare 
    l_date date := to_date(ld, 'DD/MM/YYYY');
    s_date date := to_date(sd, 'DD/MM/YYYY');
    end_time time;
    duration_i int;
    duration_t interval;
    offering record; 
    largest_sid integer;
begin 
    -- duration -> assume 1 hour first 
    SELECT duration into duration_i FROM Courses C WHERE C.course_id = cid;
    SELECT duration_i::INTEGER * INTERVAL '1 hour' into duration_t;

    end_time := startHour + duration_t; 
    SELECT * INTO offering 
    FROM Offerings O
    WHERE O.course_id = cid and O.launch_date = l_date;

    if offering is null then
        raise exception 'the offering for the session does not exist';
    end if;

    largest_sid := (select max(S.sid) from Sessions S where S.course_id = cid and S.launch_date = l_date);
    
    if new_sid <> (largest_sid + 1) then
        new_sid := largest_sid + 1;
        raise notice 'the new sid is updated to % which is the largest consecutive sid for this offering', largest_sid + 1;
    end if;

    IF offering.registration_deadline < CURRENT_DATE THEN
        Raise Notice 'Past registration deadline';
    ELSE 
        -- insert into sessions 
        insert into Sessions values (cid, l_date, new_sid, startHour, end_time, s_date, new_rid, eid);
        -- check start date, end date 
        IF s_date < offering.start_date THEN 
            update Offerings O
            set start_date = s_date, total_seating_capacity = offering.total_seating_capacity 
            + (SELECT seating_capacity FROM Rooms WHERE Rooms.rid = new_rid)
            where O.course_id = cid and O.launch_date = l_date;
        ELSIF s_date > offering.end_date THEN 
            update Offerings O
            set end_date = s_date, total_seating_capacity = offering.total_seating_capacity 
            + (SELECT seating_capacity FROM Rooms WHERE Rooms.rid = new_rid)
            where O.course_id = cid and O.launch_date = l_date;
        end if;
        
    END IF;
end;
$$ language plpgsql;

-- 25
CREATE OR REPLACE VIEW ft_workdays AS (
    select eid, num_days from (
        select eid, (CURRENT_DATE - join_date + 1) as num_days
        from Employees 
        where depart_date is null and join_date <= CURRENT_DATE and extract(MONTH from join_date) = extract(MONTH from CURRENT_DATE) and extract(YEAR from join_date) = extract(YEAR from CURRENT_DATE)
        union
        select eid, extract(DAY from CURRENT_DATE) as num_days
        from Employees
        where depart_date is null and join_date <= CURRENT_DATE and extract(MONTH from join_date) < extract(MONTH from CURRENT_DATE) and extract(YEAR from join_date) <= extract(YEAR from CURRENT_DATE)

        union

        select eid, (CURRENT_DATE - join_date + 1) as num_days
        from Employees
        where depart_date is not null and join_date <= CURRENT_DATE and extract(MONTH from depart_date) = extract(MONTH from CURRENT_DATE) and extract(YEAR from depart_date) = extract(YEAR from CURRENT_DATE)
        and extract(MONTH from join_date) = extract(MONTH from CURRENT_DATE) and extract(YEAR from join_date) = extract(YEAR from CURRENT_DATE)
        union
        select eid, extract(DAY from depart_date) as num_days
        from Employees
        where depart_date is not null and join_date <= CURRENT_DATE and extract(MONTH from depart_date) = extract(MONTH from CURRENT_DATE) and extract(YEAR from depart_date) = extract(YEAR from CURRENT_DATE)
    ) as temp natural join Full_Time_Emp
    order by eid asc
);
CREATE OR REPLACE VIEW pt_workhours AS (
    WITH temp AS (
        select S.eid, S.end_time, S.start_time
        from Sessions S natural join Part_Time_Emp -- on eid
        where extract(MONTH from s_date) = extract(MONTH from CURRENT_DATE) and extract(YEAR from s_date) = extract(YEAR from CURRENT_DATE)
        and eid in (select E.eid from employees E where E.join_date <= CURRENT_DATE)
    )
    select eid, sum(end_time - start_time) 
    from temp
    group by eid 
    order by eid asc
);
--25 function
CREATE OR REPLACE FUNCTION pay_salary()
RETURNS TABLE(eid int, name text, status text, num_work_days int, num_work_hours numeric, hourly_rate int, m_salary int, salary_paid int) AS $$
DECLARE
    current_day integer := EXTRACT(DAY from CURRENT_DATE);
    curs1 CURSOR FOR (SELECT * FROM Employees);
    --curs2 CURSOR FOR (SELECT * FROM Part_Time_Emp);
    r record;
    ft_eid integer := -1;
    pt_eid integer := -1;
BEGIN
    open curs1;
    loop
        fetch curs1 into r;
        exit when not found;
        if (ft_eid = -1 and pt_eid = -1) then
            select E.eid into ft_eid from Full_Time_Emp E where E.eid = r.eid;
            select E.eid into pt_eid from Part_Time_Emp E where E.eid = r.eid;
        else 
            if (ft_eid != -1) then
                eid := ft_eid;
                name := (select E.name from Employees E where E.eid = ft_eid);
                status := 'Full Time';
                num_work_days := (select num_days from ft_workdays E where E.eid = ft_eid );
                num_work_hours := null;
                hourly_rate := null;
                m_salary := (select monthly_salary from Full_Time_Emp E where E.eid = ft_eid);
                salary_paid := (num_work_days/current_day::decimal) * m_salary;
                if num_work_days is not null then
                    return next;
                end if;
                select E.eid into ft_eid from Full_Time_Emp E where E.eid = r.eid;
                select E.eid into pt_eid from Part_Time_Emp E where E.eid = r.eid;
                
            elsif (pt_eid != -1) then 
                eid := pt_eid;
                name := (select E.name from Employees E where E.eid = pt_eid);
                status := 'Part Time';
                num_work_days := null; 
                num_work_hours := (select (extract(epoch from sum)/3600) from pt_workhours E where E.eid = pt_eid);
                hourly_rate := (select hourly_salary from Part_Time_Emp E where E.eid = pt_eid);
                m_salary := null;
                salary_paid := hourly_rate * num_work_hours;
                if num_work_hours is not null then
                    return next;
                end if;
                select E.eid into ft_eid from Full_Time_Emp E where E.eid = r.eid;
                select E.eid into pt_eid from Part_Time_Emp E where E.eid = r.eid;
                
            end if;
        end if;
        -- reset var
    end loop;
    close curs1;
        
END;
$$ LANGUAGE plpgsql;

-- 26
create or replace function promote_courses()
returns table(custId int, custName text, c_area text, cid int, cTitle text, l_date date, 
reg_deadline date, fees numeric)
as $$
declare
    curs cursor for (select C.cust_id, C.cust_name
        from Customers C
        except
        select RC.cust_id, RC.cust_name
        from (Registers R natural join Customers C) RC 
        where RC.r_date < CURRENT_DATE - '6 month':: interval);
    curs2 refcursor; 
    r2 record; 
    inactive_customer record;
    t record;
begin 
    drop table if exists course_areas_to_rec, courses_to_rec;

    open curs;
    loop
        fetch curs into inactive_customer;
        exit when not found;

        IF inactive_customer.cust_id in (select R.cust_id from Registers R) THEN 
            -- eid 7, 9, 5, 11, 3, 6, 2, 10, 20
            -- give me the course areas that customer is interested in 
            create temp table course_areas_to_rec as 
            with t as (
                SELECT C.course_area as title FROM Registers R, Courses C 
                WHERE inactive_customer.cust_id = R.cust_id AND R.course_id = C.course_id
                AND (SELECT O.registration_deadline FROM Offerings O 
                    WHERE O.course_id = R.course_id AND O.launch_date = R.launch_date) >= CURRENT_DATE
                ORDER BY R.r_date desc limit 3
            )
            select * from t; 
             -- gives courses to recommend for this customer 
            create temp table courses_to_rec as 
            with t as (
                Select distinct L2.course_id, L2.launch_date, L3.title as course_area, L1.title, L2.registration_deadline, L2.fees
                From course_areas_to_rec L1, Offerings L2, Courses L3
                WHERE L1.title = L3.course_area AND L2.course_id = L3.course_id AND L2.registration_deadline > CURRENT_DATE
            )
            select * from t;

            open curs2 FOR SELECT * FROM courses_to_rec; 
            loop
                fetch curs2 into r2; 
                exit when not found; 
                
                custId := inactive_customer.cust_id;
                custName := (SELECT C.cust_name from Customers C where C.cust_id = inactive_customer.cust_id);
                c_area := r2.course_area;
                cid := r2.course_id; 
                cTitle := r2.title;
                l_date := r2.launch_date;
                reg_deadline := r2.registration_deadline;
                fees := r2.fees;
                RETURN NEXT;
        
            end loop;
            close curs2;
            drop table if exists course_areas_to_rec, courses_to_rec;
        ELSE
        -- eids: 1, 3, 7, 11, 13, 18 [ in customer db but nvr register for any offering ]
        
            RETURN QUERY (
                with join_table as (
                    SELECT C.course_id, C.course_area, C.title, O.launch_date, O.registration_deadline, O.fees
                    FROM Courses C join Offerings O on C.course_id = O.course_id
                )
                SELECT inactive_customer.cust_id, inactive_customer.cust_name, CO.course_area, CO.course_id, CO.title, CO.launch_date, CO.registration_deadline, CO.fees
                FROM join_table CO);
        END IF;    
    end loop;
    close curs;

    drop table if exists course_areas_to_rec, courses_to_rec;
end;
$$ language plpgsql;

-- 27
CREATE OR REPLACE FUNCTION top_packages(n integer)
RETURNS TABLE(package_id int, num_free_sess int, price int, s_date date, end_date date, num_sold int) AS $$
DECLARE
ctr int := 0;
max_num_sold int;
r record;
curs CURSOR FOR (SELECT C.package_id, C.num_free_registrations, C.price, C.sale_start_date, C.sale_end_date, count(cust_id) as num_sold 
                FROM Course_packages C natural join Buys
                GROUP BY C.package_id
                HAVING EXTRACT(YEAR from C.sale_start_date) = EXTRACT(YEAR from CURRENT_DATE)
                ORDER BY num_sold desc, price asc);

BEGIN

    SELECT count(*) INTO max_num_sold FROM Buys;

    open curs;
    loop
        fetch curs into r;
        raise notice '%', r;
        
        EXIT WHEN NOT FOUND;
            package_id := r.package_id;
            num_free_sess := r.num_free_registrations;
            price := r.price;
            s_date := r.sale_start_date;
            end_date := r.sale_end_date;
            num_sold := r.num_sold;
        IF max_num_sold > r.num_sold THEN
            if ctr = n then 
                exit;
            else
                max_num_sold := r.num_sold;
                ctr := ctr + 1;
                return next;
            end if;
        ELSE
            return next;
        END IF;

    end loop;
    close curs;
END;
$$ LANGUAGE plpgsql;

-- 28
CREATE OR REPLACE VIEW fn28_Courses AS (
    SELECT C.course_id, C.title, C.course_area, 
        (SELECT count(*) FROM Offerings O 
            WHERE C.course_id = O.course_id AND (extract(YEAR from start_date) = extract(YEAR from current_date))) as c_count
    from Courses C 
    WHERE (SELECT count(*) FROM Offerings O 
            WHERE C.course_id = O.course_id AND (extract(YEAR from start_date) = extract(YEAR from current_date))) >= 2
);

CREATE OR REPLACE VIEW fn28_Offerings AS (
  SELECT O.course_id, O.launch_date, O.start_date, (SELECT count(cust_id) FROM Registers R WHERE R.course_id = O.course_id AND R.launch_date = O.launch_date) as total_reg
  FROM Offerings O 
  WHERE O.course_id IN (SELECT C.course_id FROM fn28_Courses C) ORDER BY (O.course_id, O.start_date) asc
);

create or replace function popular_courses()
returns table(cid int, c_name text, c_area text, num_offerings int, num_latest int) as $$
declare
  curs1 CURSOR FOR (SELECT * FROM fn28_Offerings);
  r1 record; 
  prev_cid int := -1;
  prev_reg int := -1;
  c int := 0; 

begin 
  open curs1;
  loop
    FETCH curs1 into r1; 
    EXIT WHEN NOT FOUND; 
    raise notice '%', prev_cid;
    raise notice '%', prev_reg;
    IF (prev_cid = -1 AND prev_reg = -1)  THEN -- FIRST CASE
      prev_cid := r1.course_id; 
      prev_reg := r1.total_reg;
    elsif prev_cid <> r1.course_id THEN -- ANOTHER COURSE
      IF c = 0 THEN -- return this course
        cid := prev_cid;
        c_name := (SELECT title FROM Courses C where C.course_id = prev_cid);
        c_area := (SELECT course_area FROM Courses C where C.course_id = prev_cid);
        num_offerings := (SELECT c_count FROM fn28_Courses C WHERE C.course_id = prev_cid);
        num_latest := prev_reg;
        RETURN NEXT;
      END IF;
      -- reset variables
      prev_cid := r1.course_id;
      prev_reg := r1.total_reg;
      c := 0;
    elsif prev_cid = r1.course_id then -- SAME COURSE
      IF prev_reg >= r1.total_reg THEN 
        c := 1;
      END IF;
      prev_reg := r1.total_reg;
    end if; 
  end loop;
  close curs1;
end;
$$ language plpgsql;

-- 29
CREATE OR REPLACE FUNCTION view_summary_report (num_of_months INTEGER) 
RETURNS TABLE(month_and_year TEXT, total_salary_paid NUMERIC, total_sales_of_course_packages NUMERIC, total_registration_fees_via_cc NUMERIC, total_refund BIGINT, total_redemptions BIGINT) AS $$
DECLARE
    n int := num_of_months - 1;
BEGIN
    CREATE TEMPORARY TABLE temp_indexes 
    (
        col_value INT
    )
    ON COMMIT DROP;
    INSERT INTO temp_indexes(col_value) VALUES (n);

    --N column of month YYYY, left outer join to other tables
    CREATE OR REPLACE TEMPORARY VIEW month_column AS
        SELECT date_trunc('month', current_date) - (interval '1 month' * generate_series(0,(select col_value from temp_indexes))) as mc_date;
    CREATE OR REPLACE VIEW month_salary AS
        SELECT date_trunc('month', P.payment_date) as ms_date, sum(P.amount) as ms_salary_paid
        FROM Pay_slips P
        GROUP BY date_trunc('month', P.payment_date);
    --sales for course packages:
    CREATE OR REPLACE TEMPORARY VIEW month_sales_cp AS
        SELECT date_trunc('month', B.b_date) as mscp_date, sum(CP.price) as mscp_total_sales
        FROM Buys B, Course_packages CP
        WHERE B.package_id = CP.package_id
        GROUP BY date_trunc('month', B.b_date);
    --total registration fees paid via credit card
    CREATE OR REPLACE TEMPORARY VIEW month_registration_fee as
        SELECT date_trunc('month', R.r_date) as mrf_date, sum(O.fees) as mrf_total_fees
        FROM Registers R, Offerings O
        WHERE R.course_id = O.course_id AND R.launch_date = O.launch_date
        GROUP BY date_trunc('month', R.r_date);
    --total amount refunded for registration fees
    CREATE OR REPLACE TEMPORARY VIEW month_refund_amount as 
        SELECT date_trunc('month', C.cdate) as mra_date, sum(C.refund_amt) as mra_total_refund
        FROM Cancels C
        GROUP BY date_trunc('month', C.cdate);
    --total number of redemptions
    CREATE OR REPLACE TEMPORARY VIEW month_redemptions as
        SELECT date_trunc('month', R.redeem_date) as mr_date, count(R.sid) as mr_redemptions
        FROM Redeems R
        GROUP BY date_trunc('month', R.redeem_date);

    --combine views with month column
    CREATE OR REPLACE TEMPORARY VIEW combine_mc_ms AS
        SELECT MC.mc_date as combined_date, MS.ms_salary_paid as combined_salary
        FROM month_column MC LEFT OUTER JOIN month_salary MS
        ON MC.mc_date = MS.ms_date;
    CREATE OR REPLACE TEMPORARY VIEW combine_mc_mscp AS
        SELECT MC.mc_date as combined_date, MSCP.mscp_total_sales as combined_sales
        FROM month_column MC LEFT OUTER JOIN month_sales_cp MSCP
        on MC.mc_date = MSCP.mscp_date;
    CREATE OR REPLACE TEMPORARY VIEW combine_mc_mrf AS
        SELECT MC.mc_date as combined_date, MRF.mrf_total_fees as combined_fees
        FROM month_column MC LEFT OUTER JOIN month_registration_fee MRF
        on MC.mc_date = MRF.mrf_date;
    CREATE OR REPLACE TEMPORARY VIEW combine_mc_mra AS
        SELECT MC.mc_date as combined_date, MRA.mra_total_refund as combined_refund
        FROM month_column MC LEFT OUTER JOIN month_refund_amount MRA
        on MC.mc_date = MRA.mra_date;
    CREATE OR REPLACE TEMPORARY VIEW combine_mc_mr AS
        SELECT MC.mc_date as combined_date, MR.mr_redemptions as combined_redemptions
        FROM month_column MC LEFT OUTER JOIN month_redemptions MR
        on MC.mc_date = MR.mr_date;

    RETURN QUERY
        SELECT to_char(M.mc_date,'Month YYYY'), COALESCE(SP.combined_salary,0), COALESCE(TS.combined_sales,0), COALESCE(TR.combined_fees,0), COALESCE(RA.combined_refund,0), COALESCE(R.combined_redemptions,0)
        FROM month_column M, combine_mc_ms SP, combine_mc_mscp TS, combine_mc_mrf TR, combine_mc_mra RA, combine_mc_mr R
        WHERE M.mc_date = SP.combined_date AND 
            M.mc_date = TS.combined_date AND 
            M.mc_date = TR.combined_date AND 
            M.mc_date = RA.combined_date AND 
            M.mc_date = R.combined_date
        ORDER BY M.mc_date DESC;

END;
$$ LANGUAGE plpgsql;

-- 30
create or replace function view_manager_report()
returns table(m_eid int, m_name text, c_area_count int, ended_courses int, net_fees int, grossing_c_area text[]) as $$
declare 
  curs2 CURSOR FOR (SELECT M.eid, E.name FROM Managers M natural join Employees E ORDER BY E.name);
  cc_fees int := 0;
  red_fees int := 0;
  max_fees int;
  curs refcursor;
  rec record;
  store text[];
  man_eid record; 

begin
  CREATE OR REPLACE VIEW fn30_offers AS (
    SELECT O.course_id, O.launch_date FROM Offerings O WHERE 
    O.course_id IN (SELECT C.course_id FROM Course_areas CA join Courses C ON CA.name = C.course_area)
    AND EXTRACT(YEAR FROM CURRENT_DATE) = EXTRACT(YEAR FROM O.end_date)
  );

  CREATE OR REPLACE VIEW fn30_redemptions AS (
    SELECT * FROM 
    (SELECT R.course_id, R.launch_date, R.cust_id, R.cc_number, R.package_id from Redeems R
    WHERE row(R.course_id, R.launch_date) IN (SELECT O.course_id, O.launch_date FROM fn30_offers O)) L1
    natural join 
    (SELECT package_id, (price/num_free_registrations) as red_price FROM Course_packages) L2 
  );

  CREATE OR REPLACE VIEW fn30_credit_card AS (
    SELECT L1.course_id, L1.launch_date, sum(L1.fees) as fees
    FROM 
    ((select R.course_id, R.launch_date, R.cust_id, R.cc_number
    from registers R where row(R.course_id, R.launch_date) IN (SELECT O.course_id, O.launch_date FROM fn30_offers O)
    except 
    select K.course_id, K.launch_date, K.cust_id, K.cc_number
      from fn30_redemptions K
    ) C natural join Offerings O) L1
    group by (L1.course_id, L1.launch_date)
  );

  CREATE OR REPLACE VIEW fn30_total_e AS (
    SELECT L1.course_id, L1.launch_date, 
	  (SELECT coalesce((SELECT C.fees FROM fn30_credit_card C WHERE C.course_id = L1.course_id AND C.launch_date = L1.launch_date),0)) 
    + 
    (SELECT coalesce((SELECT sum(R.red_price) FROM fn30_redemptions R WHERE R.course_id = L1.course_id AND R.launch_date = L1.launch_date GROUP BY (course_id, launch_date)), 0)) as total_fees
    FROM fn30_offers L1
  );

  open curs2;
  loop 
    fetch curs2 into man_eid; 
    EXIT WHEN NOT FOUND; 
    -- this part is correct
    m_eid := man_eid.eid;
    m_name := man_eid.name;
    c_area_count := (SELECT count(*) FROM Course_areas C WHERE C.eid = man_eid.eid);
    ended_courses := (SELECT count(man_eid) FROM fn30_offers L1, Courses L2, Course_areas L3 
      WHERE L1.course_id = L2.course_id and L2.course_area = L3.name AND L3.eid = man_eid.eid);

    net_fees := (SELECT coalesce(
    (SELECT sum(L1.total_fees)
                FROM fn30_total_e L1, Courses L2, Course_areas L3
                WHERE L1.course_id = L2.course_id AND L2.course_area = L3.name AND L3.eid = man_eid.eid), 0));

    max_fees := (SELECT max(L1.total_fees)
      FROM fn30_total_e L1, Courses L2, Course_areas L3
      WHERE L1.course_id = L2.course_id AND L2.course_area = L3.name AND L3.eid = man_eid.eid);

    -- title of most grossing course
    open curs for SELECT * FROM fn30_total_e;
    loop
      FETCH curs into rec;
      EXIT WHEN NOT FOUND;
      store := array[(SELECT title FROM Courses C WHERE C.course_id = rec.course_id AND ROUND(rec.total_fees) = ROUND(max_fees) AND
        C.course_id IN (
          SELECT C.course_id 
          FROM Courses C join Course_areas CA on C.course_area = CA.name and CA.eid = man_eid.eid
      ))];
      IF grossing_c_area @> store OR store[1] IS NULL THEN 

      ELSE 
        grossing_c_area :=  grossing_c_area || store;
      end if;
    end loop;
    close curs;
    RETURN NEXT;
    grossing_c_area := array[]::text[];
  end loop;
  close curs2;
end;
$$ language plpgsql;
