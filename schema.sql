drop table if exists Customers, Credit_cards, Courses, Offerings, Sessions, Registers, Course_packages, Buys, Redeems, Cancels, 
	Employees, Part_Time_Emp, Full_Time_Emp, Instructors, Full_Time_Instructors, Part_Time_Instructors, Administrators, Managers, 
  Pay_slips, Rooms, Specializes, Course_areas cascade; 

create table Rooms (
  rid serial primary key,
  location text,
  seating_capacity integer check (seating_capacity > 0)
);

create table Employees (
  eid serial primary key,
  name  text not null,
  phone char(8) not null,
  email text not null,
  join_date date not null,
  address text not null,
  depart_date date 
);

create table Part_Time_Emp (
  eid integer,
  hourly_salary integer,
  primary key (eid),
  foreign key (eid) references Employees
    on delete cascade
);
  
create table Full_Time_Emp (
  eid integer,
  monthly_salary integer, 
  primary key (eid),
  foreign key (eid) references Employees
    on delete cascade
);
  
create table Instructors (
  eid integer primary key references Employees
    on delete cascade
);

create table Full_Time_Instructors (
  eid integer primary key references Instructors references Full_Time_Emp
    on delete cascade
); 
  
create table Part_time_Instructors (
  eid integer primary key references Instructors references Part_Time_Emp 
    on delete cascade
);
  
create table Administrators (
  eid integer primary key references Full_Time_Emp
    on delete cascade
); 
  
create table Managers (
  eid integer primary key references Full_Time_Emp
    on delete cascade
);

create table Pay_slips (
  payment_date date,
  eid integer references Employees
    on delete cascade,
  amount  numeric check (amount >= 0),
  num_work_hours  numeric check (num_work_hours >= 0),
  num_work_days integer check (num_work_days >= 0)
);
  
create table Course_areas ( 
  name text primary key, 
  eid integer not null references Managers on delete cascade
); 

create table Courses (
  course_id serial,
  duration integer not null check(duration > 0),
  description text,
  title text not null unique,
  course_area text not null,
  primary key (course_id), 
  foreign key (course_area) references Course_areas(name)
);

create table Specializes (  
  eid integer, 
  ca_name text,
  primary key (eid, ca_name),
  foreign key (eid) references Instructors on delete cascade,
  foreign key (ca_name) references Course_areas(name) on delete cascade on update cascade
);

create table Customers (
  cust_id	serial primary key,
  cust_name	text not null,
  cust_email	text not null,
  cust_address	text not null,
  cust_phone char(8) not null
);

create table Credit_cards (
  cc_number integer,
  cust_id	integer,
  CVV char(3) not null,
  expiry_date char(7) not null,
  from_date	date not null,
  primary key (cc_number),
  foreign key (cust_id) references Customers 
  	on delete cascade
);
  
create table Offerings (
  launch_date date not null,
  start_date date not null,
  end_date date not null,
  registration_deadline date not null,
  target_number_registrations integer,
  total_seating_capacity integer not null,
  fees numeric not null,
  course_id integer not null,
  eid integer not null,
  primary key (launch_date, course_id),
  foreign key(course_id) references Courses
  	on delete cascade,
  foreign key (eid) references Administrators
);
  
create table Sessions ( 
  course_id integer,
  launch_date date,
  sid integer,
  start_time time not null
    check(
      ((start_time >= '09:00:00'::time) and (start_time <= '12:00:00'::time)) or
      ((start_time >= '14:00:00'::time) and (start_time <= '18:00:00'::time))),
  end_time time not null
    check(
       ((end_time >= '09:00:00'::time) and (end_time <= '12:00:00'::time)) or
       ((end_time >= '14:00:00'::time) and (end_time <= '18:00:00'::time))),
  s_date date not null check (extract('dow' from s_date) not in (0, 6)),
  rid integer not null, 
  eid integer not null, 
  primary key (course_id, launch_date, sid), 
  unique (course_id, launch_date, start_time, s_date), 
  foreign key (course_id, launch_date) references Offerings (course_id, launch_date)
  on delete cascade
  deferrable initially deferred,
  foreign key (rid) references Rooms, 
  foreign key (eid) references Instructors, 
  check (start_time < end_time)
);
  
create table Registers (
  course_id integer,
  launch_date date, 
  sid integer,
  r_date date, 
  cust_id integer, 
  cc_number integer,
  primary key (course_id, launch_date, sid, r_date, cust_id, cc_number), 
  unique (course_id, launch_date, cust_id), 
  foreign key (course_id, launch_date, sid) references Sessions, 
  foreign key (cust_id, cc_number) references Credit_cards(cust_id, cc_number)
);

create table Course_packages (
  package_id serial,
  sale_start_date date not null,
  sale_end_date date not null,
  num_free_registrations integer not null,
  name text not null,
  price numeric not null,
  primary key(package_id)
);
  
create table Buys (
  b_date date,
  num_remaining_redemptions	integer	check (num_remaining_redemptions >= 0),
  package_id	integer references Course_packages,
  cc_number	integer,
  cust_id	integer,
  primary key (b_date, package_id, cc_number, cust_id), 
  foreign key (cust_id, cc_number) references Credit_cards(cust_id, cc_number)
    on update cascade
);

create table Redeems (
  redeem_date date,
  sid integer,
  course_id integer,
  launch_date date,
  cust_id integer,
  cc_number integer,
  b_date date,
  package_id integer,
  primary key (course_id, launch_date, sid, redeem_date, b_date, package_id, cust_id, cc_number), 
  foreign key (course_id, launch_date, sid) references Sessions,
  foreign key (b_date, package_id, cc_number, cust_id) references Buys
);
  
create table Cancels (
  cust_id integer references Customers, 
  course_id integer, 
  launch_date date, 
  sid integer, 
  cdate date, 
  refund_amt integer check (refund_amt >= 0), 
  package_credit integer check (package_credit >= 0),
  primary key (cust_id, course_id, launch_date, sid, cdate)
); 

-- triggers
drop trigger check_package on buys;
drop trigger check_employees on employees;
drop trigger check_manager on managers;
drop trigger check_administrators on administrators;
drop trigger check_FTE on Full_Time_Emp;
drop trigger check_instructors on Instructors;
drop trigger check_PTE on Part_Time_Emp;
drop trigger check_FTinstructors2 on Full_Time_Instructors;
drop trigger check_PTinstructors2 on Part_Time_Instructors;
drop trigger check_session on sessions;
drop trigger check_offerings on offerings;
drop trigger check_redemptions on redeems;
drop trigger check_cust_register on registers;


-- trigger function for packaging checking in buys  -> havent finish testing
CREATE OR REPLACE FUNCTION check_package()
RETURNS TRIGGER AS $$
DECLARE
    active int := 0;
BEGIN
    SELECT 1 into active
    FROM Buys B natural join Course_packages C-- on package_id
    WHERE B.cust_id = NEW.cust_id and (B.num_remaining_redemptions >= 1 or 
        B.package_id in (select R.package_id
                    from Redeems R join Sessions S on (R.course_id, R.launch_date, R.sid) = (S.course_id, S.launch_date, S.sid)
                    where s_date >= CURRENT_DATE + interval '7'))
    order by package_id;

    IF active = 1 THEN 
        RETURN NULL;
    ELSE 
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- trigger for package
CREATE TRIGGER check_package
BEFORE INSERT ON Buys 
FOR EACH ROW EXECUTE FUNCTION check_package();

-- trigger function for employees
create or replace function check_employees()
returns trigger as $$
declare
  m integer := 0;
  a integer := 0;
  i integer := 0;
begin
  select count(eid) into m
  from managers M
  where M.eid = NEW.eid;

  select count(eid) into a
  from administrators A
  where A.eid = NEW.eid;

  select count(eid) into i
  from instructors I
  where I.eid = NEW.eid;

  IF (m + a + i) = 1 THEN 
    RETURN NEW;
  ELSE
    RETURN NULL;
  END IF;
end;
$$ language plpgsql;

-- trigger for employees
CREATE CONSTRAINT TRIGGER isa_employee
after INSERT OR UPDATE
ON employees
DEFERRABLE INITIALLY IMMEDIATE
FOR EACH ROW
EXECUTE FUNCTION check_employees();

-- trigger functions for manager
create or replace function check_manager()
returns trigger as $$
declare 
  a integer := 0;
  i integer := 0;
  e integer := 0;
begin
  select count(eid) into a
  from administrators A
  where A.eid = NEW.eid;

  select count(eid) into i
  from instructors I
  where I.eid = NEW.eid;

  select count(eid) into e
  from employees E
  where E.eid = NEW.eid;
  
  IF (a = 0) AND (i = 0) AND (e = 1) THEN 
    RETURN NEW;
  ELSE 
    RETURN NULL;
  END IF;
end;
$$ language plpgsql;

-- trigger for manager
create trigger check_manager_trigger
before insert or update on managers
for each row 
execute function check_manager();

-- trigger function for administrators
create or replace function check_administrators()
returns trigger as $$
declare 
  m integer := 0;
  i integer := 0;
  e integer := 0;
begin
  select count(eid) into m
  from managers M
  where M.eid = NEW.eid;

  select count(eid) into i
  from instructors I
  where I.eid = NEW.eid;

  select count(eid) into e
  from employees E
  where E.eid = NEW.eid;
  
  IF (m = 0) AND (i = 0) AND (e = 1) THEN 
    RETURN NEW;
  ELSE 
    RETURN NULL;
  END IF;
end;
$$ language plpgsql;

-- trigger for administrators
create trigger check_administrator_trigger
before insert or update on administrators
for each row 
-- kiv deferrable
execute function check_administrators();

-- trigger fn for intructors 
create or replace function check_instructors()
returns trigger as $$
declare 
  m integer := 0;
  a integer := 0;
  e integer := 0;
  ft integer := 0;
  pt integer := 0;
begin
  -- is a full time or part time
  select count(eid) into m
  from managers M
  where M.eid = NEW.eid;

  select count(eid) into a
  from administrators A
  where A.eid = NEW.eid;

  -- in employee
  select count(eid) into e
  from employees E
  where E.eid = NEW.eid;

  select count(eid) into ft
  from Full_Time_Instructors FT
  where FT.eid = NEW.eid;
  
  select count(eid) into pt
  from Part_Time_Instructors PT
  where PT.eid = NEW.eid;
  
  IF (m = 0) AND (a = 0) AND (e = 1) AND (ft + pt = 1) THEN 
    RETURN NEW;
  ELSE 
    RETURN NULL;
  END IF;
end;
$$ language plpgsql;

create CONSTRAINT trigger check_instructor_trigger
after insert or update on instructors
DEFERRABLE INITIALLY IMMEDIATE
for each row 
execute function check_instructors();

create or replace function check_FTinstructors2()
returns trigger as $$
declare 
  m integer := 0;
  a integer := 0;
  e integer := 0;
  i integer := 0;
  pt integer := 0;
begin
  select count(eid) into m
  from managers M
  where M.eid = NEW.eid;

  select count(eid) into a
  from administrators A
  where A.eid = NEW.eid;

  select count(eid) into i
  from instructors I
  where I.eid = NEW.eid;

  select count(eid) into e
  from employees E
  where E.eid = NEW.eid;
  
  select count(eid) into pt
  from Part_Time_Instructors PT
  where PT.eid = NEW.eid;
  
  IF (m = 0) AND (a = 0) AND (e = 1) AND (pt = 0) AND (i = 1) THEN 
    RETURN NEW;
  ELSE 
    RETURN NULL;
  END IF;
end;
$$ language plpgsql;

create trigger check_FTinstructor_trigger
before insert or update on Full_Time_Instructors
for each row 
execute function check_FTinstructors2();

create or replace function check_PTinstructors2()
returns trigger as $$
declare 
  m integer := 0;
  a integer := 0;
  e integer := 0;
  i integer := 0;
  ft integer := 0;
begin
  select count(eid) into m
  from managers M
  where M.eid = NEW.eid;

  select count(eid) into a
  from administrators A
  where A.eid = NEW.eid;

  select count(eid) into i
  from instructors I
  where I.eid = NEW.eid;

  select count(eid) into e
  from employees E
  where E.eid = NEW.eid;
  
  select count(eid) into ft
  from Full_Time_Instructors FT
  where FT.eid = NEW.eid;
  
  IF (m = 0) AND (a = 0) AND (e = 1) AND (ft = 0) AND (i = 1) THEN 
    RETURN NEW;
  ELSE 
    RETURN NULL;
  END IF;
end;
$$ language plpgsql;

create trigger check_PTinstructor_trigger
before insert or update on Part_Time_Instructors
for each row 
execute function check_PTinstructors2();

-- full time emp 
create or replace function check_FTE()
returns trigger as $$
declare 
  e integer := 0;
  pt integer := 0;
begin 
    select count(eid) into pt 
    from Part_Time_Emp PT
    where PT.eid = NEW.eid;

    select count(eid) into e 
    from Employees E 
    where E.eid = NEW.eid;

    IF pt = 0 and e = 1 then 
    RETURN NEW;
    else return null;
    end if;
end;
$$ language plpgsql;

create trigger check_FTE_trigger
before insert or update on Full_Time_Emp
for each row 
execute function check_FTE();

-- part time emp
create or replace function check_PTE()
returns trigger as $$
declare 
  e integer := 0;
  ft integer := 0;
begin 
    select count(eid) into ft 
    from Full_Time_Emp FT
    where FT.eid = NEW.eid;

    select count(eid) into e 
    from Employees E 
    where E.eid = NEW.eid;

    IF ft = 0 and e = 1 then 
    RETURN NEW;
    else return null;
    end if;
end;
$$ language plpgsql;

create trigger check_PTE_trigger
before insert or update on Part_Time_Emp
for each row 
execute function check_PTE();

CREATE OR REPLACE FUNCTION check_offerings()
RETURNS TRIGGER AS
$$
DECLARE 
    no_days INTEGER;
    s_count INTEGER;
    total_cap INTEGER;
    earliest_s_date date;
    latest_s_date date;
BEGIN
	-- reg deadline is at least 10 days before start date:
    SELECT (NEW.start_date::date - NEW.registration_deadline::date) INTO no_days;
	-- the seating capacity of a course offering is equal to the sum of the seating capacities of its sessions:
    SELECT sum(seats) INTO total_cap
    FROM (SELECT (SELECT seating_capacity FROM Rooms R WHERE R.rid = S.rid) as seats
            FROM Sessions S 
            WHERE NEW.course_id = S.course_id
            AND NEW.launch_date = S.launch_date) L1;
	-- need to check that sessions exist when added:
	SELECT COUNT(*) INTO s_count
	FROM Sessions 
	WHERE NEW.course_id = Sessions.course_id AND NEW.launch_date = Sessions.launch_date;
    -- check start date and end date
    earliest_s_date := (select S.s_date
    from sessions S 
    where S.course_id = NEW.course_id and S.launch_date = NEW.launch_date
    order by S.s_date ASC
    limit 1);

    latest_s_date := (select S.s_date
    from sessions S 
    where S.course_id = NEW.course_id and S.launch_date = NEW.launch_date
    order by S.s_date DESC
    limit 1);

    IF no_days < 10  THEN
        raise exception 'registration deadline must be at least 10 days before the start date'; 
        RETURN NULL;
    elsif total_cap <> NEW.total_seating_capacity then 
        raise exception 'the seating capacity of a course offering must equal to the sum of the seating capacities of its sessions'; 
        RETURN NULL;
    elsif s_count < 1 then
        raise exception 'an offering must have at least 1 session'; 
        RETURN NULL;
    elsif earliest_s_date <> NEW.start_date then
        raise exception 'the earliest start date is %, the input start date is %', earliest_s_date, NEW.start_date;
        RETURN NULL;
    elsif latest_s_date <> NEW.end_date then
        raise exception 'the latest start date is %, the input end date is %', latest_s_date, NEW.end_date;
        RETURN NULL;
    ELSE
      -- passed all checks, add to table
      RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- the group one
CREATE CONSTRAINT TRIGGER non_offering
AFTER INSERT OR UPDATE
ON Offerings
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_offerings();

-- trigger function for Sessions 
CREATE OR REPLACE FUNCTION check_session()
RETURNS TRIGGER AS $$
DECLARE 
  within_time_frame integer := 0;
  s_overlap integer;
  i_overlap integer;
  ca_correct integer := 0;
  pti_work_hours interval := null;
  duration integer;
  test_r record;
BEGIN
  if OLD.rid <> NEW.rid then
    -- this is update room id
    return NEW;
  else
    select * into test_r
    FROM Sessions S 
      WHERE NEW.eid = S.eid AND NEW.s_date = S.s_date AND 
        ((S.start_time - interval '1 hour') <= NEW.end_time) AND ((S.end_time + interval '1 hour') >= NEW.start_time) limit 1;
    
    SELECT count(start_time) INTO i_overlap FROM Sessions S 
      WHERE NEW.eid = S.eid AND NEW.s_date = S.s_date AND 
        ((S.start_time - interval '1 hour') <= NEW.end_time) AND ((S.end_time + interval '1 hour') >= NEW.start_time);
    -- sums part time work hours if instructor is part time 
    
    IF NEW.eid in (SELECT eid FROM Part_Time_Instructors) THEN 
      select sum(S.end_time - S.start_time) INTO pti_work_hours
      from Sessions S
      where date_trunc('month', NEW.s_date) = date_trunc('month', S.s_date) 
      and date_trunc('year', NEW.s_date) = date_trunc('year', S.s_date) 
      and NEW.eid = S.eid
      group by date_trunc('month', S.s_date), date_trunc('year', S.s_date);
    END IF;

    IF (SELECT course_area FROM Courses C WHERE C.course_id = NEW.course_id) IN (SELECT ca_name FROM Specializes S WHERE S.eid = NEW.eid) THEN 
      ca_correct := 1;
    END IF; 

    duration := (select C.duration from Courses C where C.course_id = NEW.course_id);

    IF i_overlap = 0 AND (pti_work_hours is null OR pti_work_hours + duration * interval '01:00:00' <= interval '30:00:00') AND ca_correct = 1 
      THEN RETURN NEW; 
    ELSE 
      Raise notice 'Session cannot be added';
      RETURN NULL;
    END IF; 
  end if;
END;
$$ LANGUAGE plpgsql;

-- trigger for Sessions 
CREATE TRIGGER check_session
BEFORE INSERT OR UPDATE ON Sessions
FOR EACH ROW EXECUTE FUNCTION check_session();

-- trigger function for registers
CREATE OR REPLACE FUNCTION check_cust_register() 
RETURNS TRIGGER AS $$  
BEGIN 
    -- check that the offering that is being inserted exists
    IF (row(NEW.course_id, NEW.launch_date) NOT IN (SELECT O.course_id, O.launch_date FROM Offerings O)) THEN
      raise notice 'The course offering does not exist';
      RETURN NULL;
    ELSIF (SELECT O.registration_deadline FROM Offerings O 
      WHERE O.course_id = NEW.course_id AND O.launch_date = NEW.launch_date) <= NEW.r_date THEN 
      raise notice 'Registration deadline has passed';
      RETURN NULL;
    ELSIF (select sum(R.cust_id)
      from Registers R
      where R.course_id = NEW.course_id and R.launch_date = NEW.launch_date and R.sid = NEW.sid) =
      (select RS.seating_capacity
      from (Rooms natural join Sessions) RS
      where RS.course_id = NEW.course_id and RS.launch_date = NEW.launch_date and RS.sid = NEW.sid) THEN
      raise notice 'Session is full';
      RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; 
$$ LANGUAGE plpgsql;

-- trigger for registers
CREATE TRIGGER check_cust_register 
BEFORE INSERT OR UPDATE ON Registers 
FOR EACH ROW EXECUTE FUNCTION check_cust_register();
