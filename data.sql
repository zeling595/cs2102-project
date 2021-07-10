-- Rooms: -- added
INSERT INTO Rooms (location,seating_capacity) VALUES ('A1-1',27);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A1-2',24);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A1-3',30);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A1-4',19);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A2-1',26);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A2-2',28);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A2-3',22);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A2-4',10);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A3-1',15);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A3-2',17);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A3-3',14);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A3-4',20);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A4-1',13);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A4-2',27);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A4-3',25);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A4-4',29);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A5-1',22);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A5-2',23);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A5-3',21);
INSERT INTO Rooms (location,seating_capacity) VALUES ('A6-1',11);

-- Employees:
-- join date must be before depart_date, depart_date can be null: chcked
-- Administrators 
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Maggie','31518256','sem.ut.cursus@utsemNulla.org',TO_DATE('18-11-2019', 'DD/MM/YYYY'),'444-6889 Non, Street',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Jamal','25514445','quam.a.felis@Aeneansed.ca',TO_DATE('30-10-2019', 'DD/MM/YYYY'),'342-9459 Lobortis St.',TO_DATE('01-04-2021', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Sybill','28160613','Vivamus.sit.amet@eratsemper.net',TO_DATE('26-06-2020', 'DD/MM/YYYY'),'838-6020 Eget Rd.',TO_DATE('14-02-2021', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Vivien','81259370','nec@quisaccumsan.com',TO_DATE('12-05-2020', 'DD/MM/YYYY'),'Ap #941-3126 Interdum. Ave',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Hilel','92430789','dictum.eu@ametanteVivamus.org',TO_DATE('30-04-2020', 'DD/MM/YYYY'),'Ap #618-2034 Quisque Road',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Zephania','17716412','fermentum.convallis.ligula@egettinciduntdui.com',TO_DATE('10-08-2020', 'DD/MM/YYYY'),'406-9349 Etiam St.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Devin','55292280','quam.Pellentesque.habitant@interdumfeugiatSed.co.uk',TO_DATE('26-08-2019', 'DD/MM/YYYY'),'P.O. Box 165, 7455 Ridiculus Rd.',TO_DATE('03-08-2020', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Barclay','30992912','eu@Craspellentesque.org',TO_DATE('23-07-2021', 'DD/MM/YYYY'),'7395 Mollis. Street',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Ali','30578320','Sed@pharetra.edu',TO_DATE('02-04-2021', 'DD/MM/YYYY'),'P.O. Box 205, 6838 Nec, St.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Caldwell','14681847','Curabitur.egestas@etnuncQuisque.ca',TO_DATE('23-02-2022', 'DD/MM/YYYY'),'578-2663 Nunc, St.',null);
-- Managers
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Ariel','84464168','velit.Quisque@faucibusorci.co.uk',TO_DATE('08-10-2019', 'DD/MM/YYYY'),'Ap #195-192 Tortor St.', null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Nichole','17422026','facilisi@enimmitempor.net',TO_DATE('18-04-2020', 'DD/MM/YYYY'),'P.O. Box 976, 7170 Nulla Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Clayton','61662590','Sed.malesuada.augue@Maurisvelturpis.com',TO_DATE('07-03-2021', 'DD/MM/YYYY'),'Ap #672-8539 Sed Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Flynn','54037152','risus.Morbi.metus@Crassed.org',TO_DATE('13-05-2020', 'DD/MM/YYYY'),'660-5338 Augue Avenue',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Alvin','76056589','egestas.urna@habitantmorbitristique.com',TO_DATE('13-01-2022', 'DD/MM/YYYY'),'Ap #619-4453 Mi Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Cade','22067298','malesuada.fames.ac@Inmipede.org',TO_DATE('01-04-2021', 'DD/MM/YYYY'),'574-4936 In St.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Nelle','60075948','vitae.dolor@velitPellentesque.org',TO_DATE('17-10-2019', 'DD/MM/YYYY'),'950-9673 Sem Street',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Evan','90085233','arcu.Vivamus.sit@Nuncsed.edu',TO_DATE('19-04-2021', 'DD/MM/YYYY'),'Ap #899-4903 Imperdiet Street',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Amela','77638276','nunc@Etiamligula.edu',TO_DATE('18-11-2021', 'DD/MM/YYYY'),'P.O. Box 276, 8964 Placerat. Av.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Berk','21483821','lobortis.ultrices@Nuncquisarcu.edu',TO_DATE('18-08-2019', 'DD/MM/YYYY'),'4901 Diam Ave',null);
-- FT Instructors
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Cody','30601588','vitae.semper@ante.ca',TO_DATE('25-12-2019', 'DD/MM/YYYY'),'P.O. Box 339, 928 Auctor, Road',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Eric','10584041','Sed.malesuada@variuset.edu',TO_DATE('11-09-2021', 'DD/MM/YYYY'),'3731 Gravida Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Alden','45908661','congue@iaculislacuspede.ca',TO_DATE('13-11-2020', 'DD/MM/YYYY'),'7160 Dolor Rd.',TO_DATE('10-01-2021', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Aidan','62729076','Praesent.luctus@duiaugue.net',TO_DATE('18-11-2018', 'DD/MM/YYYY'),'754-7503 Donec Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Gary','68383304','id.sapien.Cras@scelerisquesed.edu',TO_DATE('14-02-2020', 'DD/MM/YYYY'),'Ap #357-9843 Dictum Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Cathleen','36076373','ut.quam@sit.com',TO_DATE('16-01-2019', 'DD/MM/YYYY'),'194-4825 Convallis Avenue',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Anastasia','18229369','fames.ac.turpis@eratin.co.uk',TO_DATE('11-10-2020', 'DD/MM/YYYY'),'8720 Aenean Road',TO_DATE('31-10-2020', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Carla','19594500','Phasellus.libero.mauris@nisl.com',TO_DATE('28-02-2021', 'DD/MM/YYYY'),'Ap #686-9369 Ac Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Isaiah','52568566','et.risus.Quisque@Curabiturconsequat.com',TO_DATE('11-08-2019', 'DD/MM/YYYY'),'P.O. Box 670, 5038 Vel Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Barrett','37227936','euismod@cursusdiam.co.uk',TO_DATE('28-04-2019', 'DD/MM/YYYY'),'P.O. Box 694, 4992 Neque Av.',null);
-- PT Instructors 
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Cade','85416884','leo.Morbi.neque@aliquetodio.net',TO_DATE('11-06-2019', 'DD/MM/YYYY'),'Ap #377-5933 Turpis. St.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Adria','14481306','mauris.sit.amet@ultriciesdignissimlacus.ca',TO_DATE('17-03-2021', 'DD/MM/YYYY'),'Ap #642-7586 Turpis. Ave',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Rana','34341835','malesuada.fames.ac@consequat.ca',TO_DATE('19-07-2021', 'DD/MM/YYYY'),'Ap #270-3350 Rutrum. Rd.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Galvin','55197368','Etiam.laoreet@Morbi.net',TO_DATE('20-01-2021', 'DD/MM/YYYY'),'Ap #461-6926 Integer St.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Stone','66693132','urna.nec@odioa.ca',TO_DATE('18-08-2021', 'DD/MM/YYYY'),'338-6977 Cursus St.',TO_DATE('26-03-2022', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Emily','90045513','felis@malesuadamalesuada.com',TO_DATE('26-08-2019', 'DD/MM/YYYY'),'P.O. Box 347, 4765 Semper Ave',TO_DATE('12-01-2021', 'DD/MM/YYYY'));
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Constance','50904897','ultrices.a.auctor@Aliquamvulputateullamcorper.com',TO_DATE('25-12-2018', 'DD/MM/YYYY'),'P.O. Box 698, 7759 Facilisis Av.',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Uriel','20935690','ante@nequetellusimperdiet.org',TO_DATE('02-04-2018', 'DD/MM/YYYY'),'P.O. Box 287, 6914 Eu Street',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Hammett','31113867','turpis.vitae@consequatlectus.com',TO_DATE('18-04-2018', 'DD/MM/YYYY'),'Ap #420-7551 Fringilla Street',null);
INSERT INTO Employees (name,phone,email,join_date,address,depart_date) VALUES ('Martena','79874032','tempus.lorem.fringilla@egestas.org',TO_DATE('18-05-2020', 'DD/MM/YYYY'),'868-5738 Inceptos Road',null);

-- Full Time Employees:
-- eid: 1 - 30
-- Administrators' salary = 5000
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (1,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (2,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (3,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (4,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (5,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (6,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (7,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (8,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (9,5000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (10,5000);
-- Managers's salary = 4000
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (11,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (12,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (13,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (14,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (15,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (16,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (17,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (18,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (19,4000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (20,4000);
-- FT Instructor's salary = 3000
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (21,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (22,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (23,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (24,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (25,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (26,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (27,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (28,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (29,3000);
INSERT INTO Full_Time_Emp (eid,monthly_salary) VALUES (30,3000);

-- Part Time Employees:
-- eid: 31-40
-- $40 per hour
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (31,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (32,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (33,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (34,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (35,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (36,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (37,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (38,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (39,40);
INSERT INTO Part_Time_Emp (eid,hourly_salary) VALUES (40,40);

-- Instructors:
-- eid: 21 - 40; 21-30: FT; 31-40: PT
INSERT INTO Instructors (eid) VALUES (21);
INSERT INTO Instructors (eid) VALUES (22);
INSERT INTO Instructors (eid) VALUES (23);
INSERT INTO Instructors (eid) VALUES (24);
INSERT INTO Instructors (eid) VALUES (25);
INSERT INTO Instructors (eid) VALUES (26);
INSERT INTO Instructors (eid) VALUES (27);
INSERT INTO Instructors (eid) VALUES (28);
INSERT INTO Instructors (eid) VALUES (29);
INSERT INTO Instructors (eid) VALUES (30);
INSERT INTO Instructors (eid) VALUES (31);
INSERT INTO Instructors (eid) VALUES (32);
INSERT INTO Instructors (eid) VALUES (33);
INSERT INTO Instructors (eid) VALUES (34);
INSERT INTO Instructors (eid) VALUES (35);
INSERT INTO Instructors (eid) VALUES (36);
INSERT INTO Instructors (eid) VALUES (37);
INSERT INTO Instructors (eid) VALUES (38);
INSERT INTO Instructors (eid) VALUES (39);
INSERT INTO Instructors (eid) VALUES (40);

-- Full_Time_Instructors:
-- eid: 21 - 30
INSERT INTO Full_Time_Instructors (eid) VALUES (21);
INSERT INTO Full_Time_Instructors (eid) VALUES (22);
INSERT INTO Full_Time_Instructors (eid) VALUES (23);
INSERT INTO Full_Time_Instructors (eid) VALUES (24);
INSERT INTO Full_Time_Instructors (eid) VALUES (25);
INSERT INTO Full_Time_Instructors (eid) VALUES (26);
INSERT INTO Full_Time_Instructors (eid) VALUES (27);
INSERT INTO Full_Time_Instructors (eid) VALUES (28);
INSERT INTO Full_Time_Instructors (eid) VALUES (29);
INSERT INTO Full_Time_Instructors (eid) VALUES (30);

-- Part_time_Instructors:
-- eid: 31-40
INSERT INTO Part_Time_Instructors (eid) VALUES (31);
INSERT INTO Part_Time_Instructors (eid) VALUES (32);
INSERT INTO Part_Time_Instructors (eid) VALUES (33);
INSERT INTO Part_Time_Instructors (eid) VALUES (34);
INSERT INTO Part_Time_Instructors (eid) VALUES (35);
INSERT INTO Part_Time_Instructors (eid) VALUES (36);
INSERT INTO Part_Time_Instructors (eid) VALUES (37);
INSERT INTO Part_Time_Instructors (eid) VALUES (38);
INSERT INTO Part_Time_Instructors (eid) VALUES (39);
INSERT INTO Part_Time_Instructors (eid) VALUES (40);

-- Administrators:
-- eid: 1 - 10
INSERT INTO Administrators (eid) VALUES (1);
INSERT INTO Administrators (eid) VALUES (2);
INSERT INTO Administrators (eid) VALUES (3);
INSERT INTO Administrators (eid) VALUES (4);
INSERT INTO Administrators (eid) VALUES (5);
INSERT INTO Administrators (eid) VALUES (6);
INSERT INTO Administrators (eid) VALUES (7);
INSERT INTO Administrators (eid) VALUES (8);
INSERT INTO Administrators (eid) VALUES (9);
INSERT INTO Administrators (eid) VALUES (10);

-- Managers:
-- eid: 11-20
INSERT INTO Managers (eid) VALUES (11);
INSERT INTO Managers (eid) VALUES (12);
INSERT INTO Managers (eid) VALUES (13);
INSERT INTO Managers (eid) VALUES (14);
INSERT INTO Managers (eid) VALUES (15);
INSERT INTO Managers (eid) VALUES (16);
INSERT INTO Managers (eid) VALUES (17);
INSERT INTO Managers (eid) VALUES (18);
INSERT INTO Managers (eid) VALUES (19);
INSERT INTO Managers (eid) VALUES (20);

-- Pay_Slips: -- added
-- how to calculate salary based on the ratio given by the number of work days?
-- Departed
-- checked
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),35,1000,25,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),36,400,10,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-09-2020', 'DD/MM/YYYY'),3,5000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-10-2020', 'DD/MM/YYYY'),27,3000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-12-2020', 'DD/MM/YYYY'),3,5000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),3,5000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),3,2500,null,14); -- departed 14/02/21, workday for month = 14, no of day = 28

-- PT: 31-40, $40/hr
-- checked
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-09-2020', 'DD/MM/YYYY'),33,1160,29,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-09-2020', 'DD/MM/YYYY'),34,400,10,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-09-2020', 'DD/MM/YYYY'),38,760,19,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-10-2020', 'DD/MM/YYYY'),31,520,13,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-10-2020', 'DD/MM/YYYY'),32,1160,29,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),31,880,22,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),40,760,19,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),38,320,8,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),31,680,17,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),30,240,6,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),39,480,12,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),33,360,9,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),37,560,14,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),39,600,15,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),31,660,22,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),40,360,9,null);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-04-2021', 'DD/MM/YYYY'),39,680,17,null);

-- FT: finished calculating the amount
-- checked
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),30,3000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-09-2020', 'DD/MM/YYYY'),17,4000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-09-2020', 'DD/MM/YYYY'),8,5000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-10-2020', 'DD/MM/YYYY'),4,5000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-11-2020', 'DD/MM/YYYY'),8,5000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-12-2020', 'DD/MM/YYYY'),9,5000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-12-2020', 'DD/MM/YYYY'),18,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-12-2020', 'DD/MM/YYYY'),16,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-12-2020', 'DD/MM/YYYY'),15,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),20,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),15,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-01-2021', 'DD/MM/YYYY'),18,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),19,4000,null,28);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),6,5000,null,28);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),20,4000,null,28);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),10,5000,null,28);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),11,4000,null,28);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),2,5000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),12,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),17,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),22,3000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),10,5000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('31-03-2021', 'DD/MM/YYYY'),11,4000,null,31);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-04-2021', 'DD/MM/YYYY'),8,5000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-04-2021', 'DD/MM/YYYY'),22,3000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-04-2021', 'DD/MM/YYYY'),28,3000,null,30);
INSERT INTO Pay_slips (payment_date,eid,amount,num_work_hours,num_work_days) VALUES (TO_DATE('30-04-2021', 'DD/MM/YYYY'),17,4000,null,30);

-- Course Area: -- added, eid 11-20 for managers
INSERT INTO Course_areas (name,eid) VALUES ('Database Systems',12); -- foreign key 
INSERT INTO Course_areas (name,eid) VALUES ('Networking',19);
INSERT INTO Course_areas (name,eid) VALUES ('Information Security',13);
INSERT INTO Course_areas (name,eid) VALUES ('Artificial Intelligence',18);
INSERT INTO Course_areas (name,eid) VALUES ('Natural Language Processing',11);
INSERT INTO Course_areas (name,eid) VALUES ('Information Systems',17);
INSERT INTO Course_areas (name,eid) VALUES ('Business Analytics',19);
INSERT INTO Course_areas (name,eid) VALUES ('Cloud Computing',12);
INSERT INTO Course_areas (name,eid) VALUES ('Algorithm',15);
INSERT INTO Course_areas (name,eid) VALUES ('Multimedia Information Retrival',16);
INSERT INTO Course_areas (name,eid) VALUES ('Parallel Programming',17);
INSERT INTO Course_areas (name,eid) VALUES ('Web development',12);
INSERT INTO Course_areas (name,eid) VALUES ('Machine Learning',11);
INSERT INTO Course_areas (name,eid) VALUES ('Data Science',15);
INSERT INTO Course_areas (name,eid) VALUES ('Cyber Security',12);
INSERT INTO Course_areas (name,eid) VALUES ('Game development',16);
INSERT INTO Course_areas (name,eid) VALUES ('Software Engineering',16);
INSERT INTO Course_areas (name,eid) VALUES ('User Experience',20);
INSERT INTO Course_areas (name,eid) VALUES ('Computer Vision',17);
INSERT INTO Course_areas (name,eid) VALUES ('Distributed System',19);
INSERT INTO Course_areas (name,eid) VALUES ('3D Modelling',15);
INSERT INTO Course_areas (name,eid) VALUES ('Game Development',14);
-- Database Systems|Networking|Information Security|Artificial Intelligence|Natural Language Processing|Information Systems|Business Analytics|Cloud Computing|
--Algorithm|Multimedia Information Retrival|Parallel Programming|Web development|Machine Learning|Data Science|Cyber Security|Game Development|
--Software Engineering|User Experience|Computer Vision|Distributed Systems|3D Modelling

-- --Courses:
-- added
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1-hour course on SQL for Beginners','Beginner SQL','Database Systems');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1-hour course on Advanced SQL','Advanced SQL','Database Systems');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1.5,'Crash Course on Networking for Beginners','Intro to Networking','Networking');
INSERT INTO Courses (duration,description,title,course_area) VALUES (2,'All you need to know about information security in 6 hours','General Information Security','Information Security');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1.5,'Introduction to Advanced Artificial Intelligence','Advanced Artificial Intelligence','Artificial Intelligence');
INSERT INTO Courses (duration,description,title,course_area) VALUES (3,'Learn about Business Analytics with R in 4 hours','Business Analytics with R','Business Analytics');
INSERT INTO Courses (duration,description,title,course_area) VALUES (2,'2-hour course on Optimising Algorithms','Optimisation Algorithms','Algorithm');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1 hours of Multimedia Information Retrival','Multimedia Information Retrival','Multimedia Information Retrival');
INSERT INTO Courses (duration,description,title,course_area) VALUES (3,'3-hour course on parallel programming for beginners','Intro to Parallel Programming','Parallel Programming');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1 hour on Web Application Development','Web Application Development','Web development');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1 hour on Machine Learning with Python','Machine Learning with Python','Machine Learning');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1-hour course on Data Science','Intro to Data Science','Data Science');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1.5,'Intro to Game development','Game development','Game development');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1-hour course on the fundamentals of Software Engineers','Software Engineering Fundamentals','Software Engineering');
INSERT INTO Courses (duration,description,title,course_area) VALUES (1,'1-hour introductory course on UX design','Introduction to User Experience Design', 'User Experience');
INSERT INTO Courses (duration,description,title,course_area) VALUES (3,'3-hour course on 3D Computer Vision','Introduction to 3D Computer Vision','Computer Vision');
INSERT INTO Courses (duration,description,title,course_area) VALUES (3,'a 3-hour crash course on Distributed System','Distributed System Crash Course','Distributed System');
INSERT INTO Courses (duration,description,title,course_area) VALUES (4,'a 4 hour introduction course on 3D Modelling and Animation','Introduction to 3D Modelling and Animation','3D Modelling');
INSERT INTO Courses (duration,description,title,course_area) VALUES (2,'2-hour course on Advanced Natural Language Processing','Advanced Natural Language Processing','Natural Language Processing');
INSERT INTO Courses (duration,description,title,course_area) VALUES (2,'a 2-hour introduction course to Cloud Computing','Introduction to Cloud Computing','Cloud Computing');
INSERT INTO Courses (duration,description,title,course_area) VALUES (3,'a 3-hour course on Advanced Computer Network','Advanced Computer Network','Networking');

-- Specializes -- added
-- instructor eid 21-40  
INSERT INTO Specializes (eid,ca_name) VALUES (38,'Natural Language Processing');
INSERT INTO Specializes (eid,ca_name) VALUES (25,'Algorithm');
INSERT INTO Specializes (eid,ca_name) VALUES (34,'Game development');
INSERT INTO Specializes (eid,ca_name) VALUES (30,'Data Science');
INSERT INTO Specializes (eid,ca_name) VALUES (21,'Natural Language Processing');
INSERT INTO Specializes (eid,ca_name) VALUES (27,'Business Analytics');
INSERT INTO Specializes (eid,ca_name) VALUES (24,'Database Systems');
INSERT INTO Specializes (eid,ca_name) VALUES (36,'Data Science');
INSERT INTO Specializes (eid,ca_name) VALUES (21,'Multimedia Information Retrival');
INSERT INTO Specializes (eid,ca_name) VALUES (40,'Cloud Computing');
INSERT INTO Specializes (eid,ca_name) VALUES (30,'Information Security');
INSERT INTO Specializes (eid,ca_name) VALUES (29,'Information Systems');
INSERT INTO Specializes (eid,ca_name) VALUES (33,'Information Security');
INSERT INTO Specializes (eid,ca_name) VALUES (31,'Software Engineering');
INSERT INTO Specializes (eid,ca_name) VALUES (35,'Algorithm');
INSERT INTO Specializes (eid,ca_name) VALUES (22,'Cyber Security');
INSERT INTO Specializes (eid,ca_name) VALUES (34,'Natural Language Processing');
INSERT INTO Specializes (eid,ca_name) VALUES (37,'Database Systems');
INSERT INTO Specializes (eid,ca_name) VALUES (34,'Web development');
INSERT INTO Specializes (eid,ca_name) VALUES (23,'Computer Vision');
INSERT INTO Specializes (eid,ca_name) VALUES (28,'Software Engineering');
INSERT INTO Specializes (eid,ca_name) VALUES (40,'Parallel Programming');
INSERT INTO Specializes (eid,ca_name) VALUES (34,'Networking');
INSERT INTO Specializes (eid,ca_name) VALUES (35,'Natural Language Processing');
INSERT INTO Specializes (eid,ca_name) VALUES (26,'Business Analytics');
INSERT INTO Specializes (eid,ca_name) VALUES (27,'User Experience');
INSERT INTO Specializes (eid,ca_name) VALUES (27,'Algorithm');
INSERT INTO Specializes (eid,ca_name) VALUES (39,'Information Security');
INSERT INTO Specializes (eid,ca_name) VALUES (35,'Computer Vision');
INSERT INTO Specializes (eid,ca_name) VALUES (36,'Machine Learning');
INSERT INTO Specializes (eid,ca_name) VALUES (32,'Artificial Intelligence');

-- Customers: -- added
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Nita','Proin.nisl@Sedneque.ca','628-1861 Augue Ave','43030684');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Rudyard','mattis.Integer.eu@eutellus.com','P.O. Box 864, 9116 Facilisis, Ave','96065390');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Tyler','nisi.Mauris@ipsumDonecsollicitudin.edu','Ap #175-5567 Et St.','95021646');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Nero','lorem.ac.risus@pedeultrices.ca','5368 A, Ave','92896073');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Jada','per.conubia@malesuadavel.edu','Ap #150-3687 Non Avenue','78782391');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Stacy','blandit@felispurusac.co.uk','593-9331 Morbi Av.','37768836');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Martha','Pellentesque.ultricies.dignissim@eratEtiamvestibulum.ca','7972 Mattis Street','95217535');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('May','aliquet.metus@Curabitursedtortor.co.uk','3835 Nam Rd.','66401003');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Kenneth','dui.Cras.pellentesque@acmetusvitae.co.uk','P.O. Box 708, 4175 Netus Rd.','63290820');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Kellie','amet.lorem@luctus.co.uk','333-1367 Arcu. Av.','36278722');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Harrison','eu@tellusnonmagna.com','678-8593 Dictum. Ave','16573715');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Lee','pretium@Maecenasiaculisaliquet.com','Ap #570-7157 Enim. Av.','31901753');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Harrison','Suspendisse.ac@leoCrasvehicula.edu','P.O. Box 434, 4124 Etiam Ave','98181172');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Keane','scelerisque.dui@Suspendisse.net','424-7149 Vulputate, St.','84024026');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Coby','ornare.placerat.orci@felis.ca','P.O. Box 528, 4411 Nulla. Street','75733394');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Hoyt','Nunc.pulvinar.arcu@turpis.com','9777 Auctor Av.','64935410');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Levi','turpis.Nulla.aliquet@senectus.net','Ap #528-5977 Nonummy Ave','38422522');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Luke','luctus.aliquet.odio@Fuscefermentumfermentum.ca','Ap #308-8481 Luctus St.','79438222');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Amir','ipsum@eleifendnon.edu','P.O. Box 862, 2003 Tincidunt Rd.','35510757');
INSERT INTO Customers (cust_name,cust_email,cust_address,cust_phone) VALUES ('Brianna','vulputate.dui.nec@Crasdictum.org','P.O. Box 861, 2470 Egestas. Rd.','80436412');

-- Credit Card: --added 
-- from_date is when the card is used actively bc we can change the credit card & shld be before expiry date 
-- from date checked
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (1,1168,'973','06/2022', TO_DATE('06-03-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (2,3728,'155','09/2021', TO_DATE('07-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (3,2713,'119','06/2021', TO_DATE('07-02-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (4,2860,'944','05/2023', TO_DATE('07-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (5,4709,'780','04/2022', TO_DATE('02-04-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (6,2427,'932','06/2021', TO_DATE('08-03-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (7,1531,'249','02/2023', TO_DATE('04-02-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (8,3468,'737','06/2021', TO_DATE('07-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (9,2311,'334','12/2025', TO_DATE('04-03-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (10,1725,'193','08/2024', TO_DATE('01-02-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (11,1957,'523','12/2022', TO_DATE('06-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (12,3509,'363','01/2024', TO_DATE('04-04-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (13,1821,'159','11/2022', TO_DATE('11-02-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (14,4012,'626','07/2025', TO_DATE('02-03-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (15,1735,'378','02/2022', TO_DATE('08-02-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (16,1012,'201','02/2022', TO_DATE('03-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (17,3177,'344','06/2023', TO_DATE('08-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (18,1468,'975','06/2021', TO_DATE('06-01-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (19,4883,'887','04/2023', TO_DATE('02-03-2021', 'DD/MM/YYYY'));
INSERT INTO Credit_cards (cust_id,cc_number,CVV,expiry_date,from_date) VALUES (20,3178,'951','12/2021', TO_DATE('17-03-2021', 'DD/MM/YYYY'));

-- Offerings
-- course with multiple offerings, course has no offerings
-- checked
begin;
    -- 1, every week, 1 hour - Database Systems ; 24, 37
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),1,'09:00:00','10:00:00', TO_DATE('03-12-2020', 'DD/MM/YYYY'),3,24);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),2,'09:00:00','10:00:00', TO_DATE('10-12-2020', 'DD/MM/YYYY'),11,37);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),3,'09:00:00','10:00:00', TO_DATE('17-12-2020', 'DD/MM/YYYY'),4,24);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),4,'14:30:00','15:30:00', TO_DATE('05-04-2021', 'DD/MM/YYYY'),11,37);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),5,'14:30:00','15:30:00', TO_DATE('31-03-2021', 'DD/MM/YYYY'),3,24);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),6,'14:30:00','15:30:00', TO_DATE('07-04-2021', 'DD/MM/YYYY'),8,37);
    INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('05-04-2020', 'DD/MM/YYYY'),TO_DATE('02-10-2020', 'DD/MM/YYYY'),TO_DATE('03-12-2020','DD/MM/YYYY'),TO_DATE('07-04-2021','DD/MM/YYYY'),100,117,100,1,5);
commit; 

begin;
     -- 2, every 2 weeks, 1 hour - Database Systems ; eid : 24, 37
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (2,TO_DATE('17-04-2020','DD/MM/YYYY'),1,'16:00:00','17:00:00',TO_DATE('25-08-2020', 'DD/MM/YYYY'),10,24);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (2,TO_DATE('17-04-2020','DD/MM/YYYY'),2,'11:00:00','12:00:00',TO_DATE('11-08-2020', 'DD/MM/YYYY'),17,37);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (2,TO_DATE('17-04-2020','DD/MM/YYYY'),3,'11:00:00','12:00:00',TO_DATE('08-09-2020', 'DD/MM/YYYY'),7,37);
    INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (2,TO_DATE('17-04-2020','DD/MM/YYYY'),4,'16:00:00','17:00:00',TO_DATE('22-04-2021', 'DD/MM/YYYY'),12,24);
    INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('17-04-2020', 'DD/MM/YYYY'),TO_DATE('18-07-2020', 'DD/MM/YYYY'),TO_DATE('11-08-2020','DD/MM/YYYY'),TO_DATE('22-04-2021','DD/MM/YYYY'),75,81,100,2,7);
commit;

begin;
-- 3, 2 in a week, fri, tues, 2 hours - Networking ; eid : 34, total 18
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),1,'09:00:00','11:00:00',TO_DATE('09-10-2020', 'DD/MM/YYYY'),5,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),2,'09:00:00','11:00:00',TO_DATE('13-10-2020', 'DD/MM/YYYY'),4,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),3,'09:00:00','11:00:00',TO_DATE('16-10-2020', 'DD/MM/YYYY'),14,34);

INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),4,'09:00:00','11:00:00',TO_DATE('12-10-2020', 'DD/MM/YYYY'),5,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),5,'14:00:00','16:00:00',TO_DATE('12-10-2020', 'DD/MM/YYYY'),4,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),6,'09:00:00','11:00:00',TO_DATE('15-10-2020', 'DD/MM/YYYY'),14,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),7,'14:00:00','16:00:00',TO_DATE('15-10-2020', 'DD/MM/YYYY'),5,34);

INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),8,'14:00:00','16:00:00',TO_DATE('09-10-2020', 'DD/MM/YYYY'),4,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-07-2020','DD/MM/YYYY'),9,'14:00:00','16:00:00',TO_DATE('13-10-2020', 'DD/MM/YYYY'),14,34);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('07-07-2020', 'DD/MM/YYYY'),TO_DATE('13-09-2020', 'DD/MM/YYYY'),TO_DATE('09-10-2020','DD/MM/YYYY'),TO_DATE('16-10-2020','DD/MM/YYYY'),65,216,300,3,6);
commit; 

begin;
-- 3, 2 in a week, fri, tues, 2 hours - Networking ; eid : 34, total 12
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-08-2020','DD/MM/YYYY'),1,'09:00:00','11:00:00',TO_DATE('19-10-2020', 'DD/MM/YYYY'),5,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-08-2020','DD/MM/YYYY'),2,'14:00:00','16:00:00',TO_DATE('20-10-2020', 'DD/MM/YYYY'),4,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-08-2020','DD/MM/YYYY'),3,'09:00:00','11:00:00',TO_DATE('21-10-2020', 'DD/MM/YYYY'),14,34);

INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-08-2020','DD/MM/YYYY'),4,'14:00:00','16:00:00',TO_DATE('28-10-2020', 'DD/MM/YYYY'),5,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-08-2020','DD/MM/YYYY'),5,'09:00:00','11:00:00',TO_DATE('30-10-2020', 'DD/MM/YYYY'),4,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (3,TO_DATE('07-08-2020','DD/MM/YYYY'),6,'09:00:00','11:00:00',TO_DATE('29-10-2020', 'DD/MM/YYYY'),1,34);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('07-08-2020', 'DD/MM/YYYY'),TO_DATE('13-09-2020', 'DD/MM/YYYY'),TO_DATE('19-10-2020','DD/MM/YYYY'),TO_DATE('30-10-2020','DD/MM/YYYY'),100,144,300,3,6);
commit; 

begin;
-- 4, every month, 2 hours - Information Security; eid: 30 33 39
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (4,TO_DATE('13-04-2020','DD/MM/YYYY'),1,'15:00:00','17:00:00',TO_DATE('14-10-2020', 'DD/MM/YYYY'),8,30);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (4,TO_DATE('13-04-2020','DD/MM/YYYY'),2,'15:00:00','17:00:00',TO_DATE('18-11-2020', 'DD/MM/YYYY'),2,33);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (4,TO_DATE('13-04-2020','DD/MM/YYYY'),3,'15:00:00','17:00:00',TO_DATE('16-12-2020', 'DD/MM/YYYY'),14,39);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('13-04-2020', 'DD/MM/YYYY'),TO_DATE('31-05-2020', 'DD/MM/YYYY'),TO_DATE('14-10-2020','DD/MM/YYYY'),TO_DATE('16-12-2020','DD/MM/YYYY'),55,61,100,4,8);
commit; 

begin; --5
-- 5, every 2 week, 1.5 hours - Artifical Intelligence ; eid: 32
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (5,TO_DATE('13-07-2020','DD/MM/YYYY'),1,'09:30:00','11:00:00',TO_DATE('08-09-2020', 'DD/MM/YYYY'),4,32);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (5,TO_DATE('13-07-2020','DD/MM/YYYY'),2,'09:30:00','11:00:00',TO_DATE('22-09-2020', 'DD/MM/YYYY'),20,32);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (5,TO_DATE('13-07-2020','DD/MM/YYYY'),3,'09:30:00','11:00:00',TO_DATE('05-10-2020', 'DD/MM/YYYY'),3,32);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('13-07-2020', 'DD/MM/YYYY'),TO_DATE('12-08-2020', 'DD/MM/YYYY'),TO_DATE('08-09-2020','DD/MM/YYYY'),TO_DATE('05-10-2020','DD/MM/YYYY'),50,60,100,5,8);
commit;

begin; --6
-- 6, every month, 3 hours - Business Analytics ; 27, 26
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (6,TO_DATE('12-11-2020','DD/MM/YYYY'),1,'09:00:00','12:00:00',TO_DATE('25-03-2021', 'DD/MM/YYYY'),8,27);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (6,TO_DATE('12-11-2020','DD/MM/YYYY'),2,'09:00:00','12:00:00',TO_DATE('01-04-2021', 'DD/MM/YYYY'),20,26);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (6,TO_DATE('12-11-2020','DD/MM/YYYY'),3,'09:00:00','12:00:00',TO_DATE('02-04-2021', 'DD/MM/YYYY'),12,26);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('12-11-2020', 'DD/MM/YYYY'),TO_DATE('12-01-2021', 'DD/MM/YYYY'),TO_DATE('25-03-2021','DD/MM/YYYY'),TO_DATE('02-04-2021','DD/MM/YYYY'),35,41,100,6,2);
commit;

begin; --7
-- add_session(7,'21/11/2021',4,'13/09/2022',TIME'16:00:00', 25,15);

-- 7, every week, 2 hours - Algorithm ; 25 35 27 
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (7,TO_DATE('21-11-2021','DD/MM/YYYY'),1,'15:00:00','17:00:00',TO_DATE('30-08-2022', 'DD/MM/YYYY'),10,25);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (7,TO_DATE('21-11-2021','DD/MM/YYYY'),2,'15:00:00','17:00:00',TO_DATE('06-09-2022', 'DD/MM/YYYY'),16,35);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (7,TO_DATE('21-11-2021','DD/MM/YYYY'),3,'15:00:00','17:00:00',TO_DATE('13-09-2022', 'DD/MM/YYYY'),2,27);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (7,TO_DATE('21-11-2021','DD/MM/YYYY'),4,'16:00:00','18:00:00',TO_DATE('13-09-2022', 'DD/MM/YYYY'),15,25);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('21-11-2021', 'DD/MM/YYYY'),TO_DATE('01-06-2022', 'DD/MM/YYYY'),TO_DATE('30-08-2022','DD/MM/YYYY'),TO_DATE('13-09-2022','DD/MM/YYYY'),60,95,100,7,2);
commit;

begin;
-- 8, every week, 1 hours - Multimedia Information Retrieval ; eid : 21
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (8,TO_DATE('28-05-2021','DD/MM/YYYY'),1,'09:00:00','10:00:00',TO_DATE('14-03-2022', 'DD/MM/YYYY'),3,21);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (8,TO_DATE('28-05-2021','DD/MM/YYYY'),2,'09:00:00','10:00:00',TO_DATE('21-03-2022', 'DD/MM/YYYY'),14,21);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (8,TO_DATE('28-05-2021','DD/MM/YYYY'),3,'09:00:00','10:00:00',TO_DATE('28-03-2022', 'DD/MM/YYYY'),11,21);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('28-05-2021', 'DD/MM/YYYY'),TO_DATE('04-08-2021', 'DD/MM/YYYY'),TO_DATE('14-03-2022','DD/MM/YYYY'),TO_DATE('28-03-2022','DD/MM/YYYY'),60,71,100,8,10);
commit;

begin;
-- 9, every week, 3 hours ; eid: 40
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),1,'14:30:00','17:30:00',TO_DATE('30-09-2022', 'DD/MM/YYYY'),16,40);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),2,'14:30:00','17:30:00',TO_DATE('07-10-2022', 'DD/MM/YYYY'),13,40);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),3,'14:30:00','17:30:00',TO_DATE('14-10-2022', 'DD/MM/YYYY'),9,40);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('03-01-2022', 'DD/MM/YYYY'),TO_DATE('04-03-2022', 'DD/MM/YYYY'),TO_DATE('30-09-2022','DD/MM/YYYY'),TO_DATE('14-10-2022','DD/MM/YYYY'),50,57,100,9,3);
commit;

begin;
-- 10, 1 hour ; 34
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (10,TO_DATE('03-08-2020', 'DD/MM/YYYY'),1,'16:00:00','17:00:00', TO_DATE('07-04-2021', 'DD/MM/YYYY'),8,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (10,TO_DATE('03-08-2020', 'DD/MM/YYYY'),2,'16:00:00','17:00:00', TO_DATE('02-04-2021', 'DD/MM/YYYY'),10,34);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('03-08-2020', 'DD/MM/YYYY'),TO_DATE('28-10-2020', 'DD/MM/YYYY'),TO_DATE('02-04-2021', 'DD/MM/YYYY'),TO_DATE('07-04-2021', 'DD/MM/YYYY'),20,27,100,10,10);
commit;

begin;
-- 11, 1 hour ; 36
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),1,'09:00:00','10:00:00', TO_DATE('22-03-2022', 'DD/MM/YYYY'),6,36);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),2,'09:00:00','10:00:00', TO_DATE('19-04-2022', 'DD/MM/YYYY'),7,36);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('26-11-2021', 'DD/MM/YYYY'),TO_DATE('31-12-2021', 'DD/MM/YYYY'),TO_DATE('22-03-2022','DD/MM/YYYY'),TO_DATE('19-04-2022','DD/MM/YYYY'),40,50,100,11,7);
commit;

begin;
-- 12, 1 hour ; 30, 36
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (12,TO_DATE('05-12-2020', 'DD/MM/YYYY'),1,'14:30:00','15:30:00', TO_DATE('25-06-2021', 'DD/MM/YYYY'),1,30);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (12,TO_DATE('05-12-2020', 'DD/MM/YYYY'),2,'14:30:00','15:30:00', TO_DATE('02-07-2021', 'DD/MM/YYYY'),13,36);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('05-12-2020', 'DD/MM/YYYY'),TO_DATE('01-05-2021', 'DD/MM/YYYY'),TO_DATE('25-06-2021','DD/MM/YYYY'),TO_DATE('02-07-2021','DD/MM/YYYY'),30,40,100,12,2);
commit;

begin;
-- 13, 2 hours ; 34 first offering
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (13,TO_DATE('10-11-2020', 'DD/MM/YYYY'),1,'09:00:00','11:00:00', TO_DATE('06-12-2021', 'DD/MM/YYYY'),2,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (13,TO_DATE('10-11-2020', 'DD/MM/YYYY'),2,'09:00:00','11:00:00', TO_DATE('18-11-2021', 'DD/MM/YYYY'),17,34);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('10-11-2020', 'DD/MM/YYYY'),TO_DATE('23-07-2021', 'DD/MM/YYYY'),TO_DATE('18-11-2021','DD/MM/YYYY'),TO_DATE('06-12-2021','DD/MM/YYYY'),35,46,100,13,4);
commit;

begin;
-- 13, 3 hours; 34 second offering 
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (13,TO_DATE('10-06-2020', 'DD/MM/YYYY'),1,'09:00:00','11:00:00', TO_DATE('14-12-2021', 'DD/MM/YYYY'),2,34);
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (13,TO_DATE('10-06-2020', 'DD/MM/YYYY'),2,'09:00:00','11:00:00', TO_DATE('19-07-2021', 'DD/MM/YYYY'),17,34);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('10-06-2020', 'DD/MM/YYYY'),TO_DATE('01-07-2021', 'DD/MM/YYYY'),TO_DATE('19-07-2021', 'DD/MM/YYYY'),TO_DATE('14-12-2021', 'DD/MM/YYYY'),35,46,100,13,4);
commit;

begin;
-- 14, 1 hour ; 31, 28 first offering
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (14,TO_DATE('20-03-2020', 'DD/MM/YYYY'),1,'16:00:00','17:00:00', TO_DATE('09-04-2021', 'DD/MM/YYYY'),5,28);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('20-03-2020', 'DD/MM/YYYY'),TO_DATE('27-03-2021', 'DD/MM/YYYY'),TO_DATE('09-04-2021', 'DD/MM/YYYY'),TO_DATE('09-04-2021', 'DD/MM/YYYY'),20,26,100,14,1);
commit;

begin;
-- 14, 1 hour ; 31, 28 second offering
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (14,TO_DATE('20-06-2020', 'DD/MM/YYYY'),1,'16:00:00','17:00:00', TO_DATE('09-08-2021', 'DD/MM/YYYY'),5,31);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('20-06-2020', 'DD/MM/YYYY'),TO_DATE('22-07-2021', 'DD/MM/YYYY'),TO_DATE('09-08-2021','DD/MM/YYYY'),TO_DATE('09-08-2021','DD/MM/YYYY'),20,26,100,14,1);
commit;

begin;
-- 14, 1 hour ; 31, 28 third offering
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (14,TO_DATE('20-09-2020', 'DD/MM/YYYY'),1,'16:00:00','17:00:00', TO_DATE('08-04-2021', 'DD/MM/YYYY'),5,28);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('20-09-2020', 'DD/MM/YYYY'),TO_DATE('22-10-2020', 'DD/MM/YYYY'),TO_DATE('08-04-2021', 'DD/MM/YYYY'),TO_DATE('08-04-2021','DD/MM/YYYY'),20,26,100,14,1);
commit;

begin;
-- 15, 1 hour ; 27
INSERT INTO Sessions (course_id,launch_date,sid,start_time,end_time,s_date,rid,eid) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1,'16:00:00','17:00:00', TO_DATE('19-07-2021', 'DD/MM/YYYY'),19,27);
INSERT INTO Offerings (launch_date,registration_deadline,start_date,end_date,target_number_registrations,total_seating_capacity,fees,course_id,eid) VALUES (TO_DATE('14-04-2021', 'DD/MM/YYYY'),TO_DATE('18-06-2021', 'DD/MM/YYYY'),TO_DATE('19-07-2021','DD/MM/YYYY'),TO_DATE('19-07-2021','DD/MM/YYYY'),15,21,100,15,10);
commit;

-- Registers: 
-- matched cc_num and cid to CreditCards and courseid, launch and sid to Sessions
-- checked for r_date before r_deadline from offerings
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (1,TO_DATE('05-04-2020', 'DD/MM/YYYY'),1, TO_DATE('03-06-2020', 'DD/MM/YYYY'),8,3468);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (1,TO_DATE('05-04-2020', 'DD/MM/YYYY'),3, TO_DATE('25-06-2020', 'DD/MM/YYYY'),17,3177); -- 0
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (1,TO_DATE('05-04-2020', 'DD/MM/YYYY'),5, TO_DATE('06-05-2020', 'DD/MM/YYYY'),16,1012);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (2,TO_DATE('17-04-2020', 'DD/MM/YYYY'),1, TO_DATE('16-05-2020', 'DD/MM/YYYY'),19,4883);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (3,TO_DATE('07-07-2020', 'DD/MM/YYYY'),3, TO_DATE('02-08-2020', 'DD/MM/YYYY'),4,2860);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (4,TO_DATE('13-04-2020', 'DD/MM/YYYY'),2, TO_DATE('25-05-2020', 'DD/MM/YYYY'),14,4012);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),2, TO_DATE('29-11-2021', 'DD/MM/YYYY'),8,3468);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (5,TO_DATE('13-07-2020', 'DD/MM/YYYY'),1, TO_DATE('29-07-2020', 'DD/MM/YYYY'),14,4012);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (4,TO_DATE('13-04-2020', 'DD/MM/YYYY'),1, TO_DATE('23-04-2020', 'DD/MM/YYYY'),12,3509); -- 0
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (8,TO_DATE('28-05-2021', 'DD/MM/YYYY'),1, TO_DATE('12-07-2021', 'DD/MM/YYYY'),8,3468);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (9,TO_DATE('03-01-2022', 'DD/MM/YYYY'),1, TO_DATE('04-12-2021', 'DD/MM/YYYY'),20,3178);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),2, TO_DATE('20-12-2021', 'DD/MM/YYYY'),20,3178);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (13,TO_DATE('10-11-2020', 'DD/MM/YYYY'),1, TO_DATE('23-04-2021', 'DD/MM/YYYY'),14,4012);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),2, TO_DATE('19-08-2021', 'DD/MM/YYYY'),6,2427);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1, TO_DATE('01-05-2021', 'DD/MM/YYYY'),2,3728);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (14,TO_DATE('20-06-2020', 'DD/MM/YYYY'),1, TO_DATE('29-08-2020', 'DD/MM/YYYY'),15,1735); -- 0
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (13,TO_DATE('10-11-2020', 'DD/MM/YYYY'),1, TO_DATE('18-06-2021', 'DD/MM/YYYY'),5,4709); -- 0
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (12,TO_DATE('05-12-2020', 'DD/MM/YYYY'),2, TO_DATE('05-03-2021', 'DD/MM/YYYY'),9,2311);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (6,TO_DATE('12-11-2020', 'DD/MM/YYYY'),2, TO_DATE('17-12-2020', 'DD/MM/YYYY'),14,4012);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),3, TO_DATE('13-09-2021', 'DD/MM/YYYY'),10,1725);
-- -- cust 12
-- INSERT INTO Registers(course_id, launch_date,sid, r_date, cust_id, cc_number) VALUES (13,TO_DATE('10-06-2020','DD/MM/YYYY'),1,TO_DATE( '07-07-2021', 'DD/MM/YYYY'),12, 3509); 
-- INSERT INTO Registers(course_id, launch_date,sid, r_date, cust_id, cc_number) VALUES (13,TO_DATE('10-06-2020','DD/MM/YYYY'),1,TO_DATE( '01-04-2022', 'DD/MM/YYYY'),12, 3509); 
-- -- CUST 15 TRIAL       
-- INSERT INTO Registers(course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (13,TO_DATE('10-06-2020', 'DD/MM/YYYY'),1,TO_DATE('02-07-2021', 'DD/MM/YYYY'),15,1735);
-- INSERT INTO Registers(course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),3,TO_DATE('05-07-2021', 'DD/MM/YYYY'),15,1735);

INSERT INTO Registers(course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),2,TO_DATE('07-03-2021', 'DD/MM/YYYY'),17,3177); 
-- hzl 
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),1,TO_DATE('14-05-2022', 'DD/MM/YYYY'),6,2427);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (9,TO_DATE('03-01-2022', 'DD/MM/YYYY'),1,TO_DATE('01-03-2022', 'DD/MM/YYYY'),11,1957);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),2,TO_DATE( '28-11-2021', 'DD/MM/YYYY'),18,1468);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1,TO_DATE('08-06-2021', 'DD/MM/YYYY'),3,2713); 

-- zl
INSERT INTO Registers (course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),1,TO_DATE('01-05-2022', 'DD/MM/YYYY'),7,1531);
INSERT INTO Registers (course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (8,TO_DATE('28-05-2021', 'DD/MM/YYYY'),1,TO_DATE('23-07-2021', 'DD/MM/YYYY'),17,3177);
INSERT INTO Registers (course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),1,TO_DATE('04-12-2021', 'DD/MM/YYYY'),4,2860);
INSERT INTO Registers (course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),3,TO_DATE( '23-05-2022', 'DD/MM/YYYY'),9,2311);
INSERT INTO Registers (course_id, launch_date, sid, r_date, cust_id, cc_number) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),2,TO_DATE( '07-03-2022', 'DD/MM/YYYY'),5,4709); 

-- shar
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (14,TO_DATE('20-09-2020', 'DD/MM/YYYY'),1, TO_DATE('01-10-2020', 'DD/MM/YYYY'),17,3177);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (13,TO_DATE('10-06-2020', 'DD/MM/YYYY'),1, TO_DATE('15-02-2021', 'DD/MM/YYYY'),5,4709);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1, TO_DATE('07-02-2021' ,'DD/MM/YYYY'),5,4709);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (12,TO_DATE('05-12-2020', 'DD/MM/YYYY'),1, TO_DATE('16-05-2020', 'DD/MM/YYYY'),18,1468);
INSERT INTO Registers (course_id,launch_date,sid,r_date,cust_id,cc_number) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),1, TO_DATE('02-08-2020', 'DD/MM/YYYY'),18,1468);

-- Course Package: -- added 
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('28-04-2021', 'DD/MM/YYYY'),TO_DATE('10-05-2021', 'DD/MM/YYYY'),30,'Package1',1250);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('05-04-2021', 'DD/MM/YYYY'),TO_DATE('01-05-2021', 'DD/MM/YYYY'),25,'Package2',1000);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('12-04-2021', 'DD/MM/YYYY'),TO_DATE('18-04-2021', 'DD/MM/YYYY'),20,'Package3',900);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('05-04-2021', 'DD/MM/YYYY'),TO_DATE('10-04-2021', 'DD/MM/YYYY'),15,'Package4',600);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('02-04-2021', 'DD/MM/YYYY'),TO_DATE('17-04-2021', 'DD/MM/YYYY'),10,'Package5',450);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('20-04-2021', 'DD/MM/YYYY'),TO_DATE('30-04-2021', 'DD/MM/YYYY'),2,'Trial',150); 
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('14-04-2021', 'DD/MM/YYYY'),TO_DATE('20-04-2021', 'DD/MM/YYYY'),20,'Package6',750);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('20-04-2021', 'DD/MM/YYYY'),TO_DATE('04-05-2021', 'DD/MM/YYYY'),30,'Package7',1100);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('21-04-2021', 'DD/MM/YYYY'),TO_DATE('22-05-2021', 'DD/MM/YYYY'),15,'Package8',500);
INSERT INTO Course_packages (sale_start_date,sale_end_date,num_free_registrations,name,price) VALUES (TO_DATE('23-04-2021', 'DD/MM/YYYY'),TO_DATE('13-05-2021', 'DD/MM/YYYY'),25,'Package9',875);

-- Buys: added
-- package id 1-10 ?
-- foreign key cc_number and cust_id checked
-- 0 redemptions left, all trial
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('30-03-2021', 'DD/MM/YYYY'),2,6,3509,12); -- partially active package
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('19-01-2021', 'DD/MM/YYYY'),2,6,1735,15); 

INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('13-02-2020', 'DD/MM/YYYY'),0,6,3177,17); -- has an active package 
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('07-02-2021', 'DD/MM/YYYY'),0,6,4709,5); -- has an active package 
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('21-02-2021', 'DD/MM/YYYY'),0,6,1468,18); -- has an active package

INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('06-03-2021', 'DD/MM/YYYY'),29,1,2427,6); -- 30
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('10-04-2021', 'DD/MM/YYYY'),29,1,3468,8); -- 30
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('28-02-2021', 'DD/MM/YYYY'),1,6,1957,11); -- 2
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('16-01-2021', 'DD/MM/YYYY'),19,7,2311,9); -- 20
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('30-04-2021', 'DD/MM/YYYY'),15,4,4012,14); -- 15
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('04-03-2021', 'DD/MM/YYYY'),24,10,2860,4); -- 25
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('21-02-2021', 'DD/MM/YYYY'),24,2,1468,18); -- 25
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('04-02-2021', 'DD/MM/YYYY'),20,3,4883,19); -- 20
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('26-04-2021', 'DD/MM/YYYY'),19,3,3177,17); -- 20
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('17-03-2021', 'DD/MM/YYYY'),15,9,1012,16); -- 15
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('11-04-2021', 'DD/MM/YYYY'),30,1,1168,1); -- 30
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('05-01-2021', 'DD/MM/YYYY'),10,5,3728,2); -- 10
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('04-04-2021', 'DD/MM/YYYY'),20,3,1725,10); -- 20
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('20-03-2021', 'DD/MM/YYYY'),9,5,2713,3); -- 10
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('13-02-2021', 'DD/MM/YYYY'),24,2,4709,5); -- 25
INSERT INTO Buys (b_date,num_remaining_redemptions,package_id,cc_number,cust_id) VALUES (TO_DATE('18-03-2021', 'DD/MM/YYYY'),19,7,1531,7); -- 20

-- Redeems: 
-- 
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),1,TO_DATE('06-03-2021', 'DD/MM/YYYY'),1,2427,6,TO_DATE('14-07-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (8,TO_DATE('28-05-2021', 'DD/MM/YYYY'),3,TO_DATE('10-04-2021', 'DD/MM/YYYY'),1,3468,8, TO_DATE('13-01-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (9,TO_DATE('03-01-2022', 'DD/MM/YYYY'),1,TO_DATE('28-02-2021', 'DD/MM/YYYY'),6,1957,11, TO_DATE('19-05-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),2,TO_DATE('21-02-2021', 'DD/MM/YYYY'),2,1468,18,TO_DATE( '28-02-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1,TO_DATE('20-03-2021', 'DD/MM/YYYY'),5,2713,3,TO_DATE( '28-06-2021', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),1,TO_DATE('18-03-2021', 'DD/MM/YYYY'),7,1531,7, TO_DATE('01-07-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (8,TO_DATE('28-05-2021', 'DD/MM/YYYY'),1,TO_DATE('26-04-2021', 'DD/MM/YYYY'),3,3177,17, TO_DATE('23-12-2021', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),1,TO_DATE('04-03-2021', 'DD/MM/YYYY'),10,2860,4, TO_DATE('04-01-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),3,TO_DATE('16-01-2021', 'DD/MM/YYYY'),7,2311,9,TO_DATE( '23-05-2022', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),2,TO_DATE('13-02-2021', 'DD/MM/YYYY'),2,4709,5,TO_DATE( '07-03-2022', 'DD/MM/YYYY')); 
-- -- cust 12 trial, partially active
-- INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (1,TO_DATE('05-04-2020','DD/MM/YYYY'),6,TO_DATE('30-03-2021', 'DD/MM/YYYY'),6,3509,12,TO_DATE( '07-03-2021', 'DD/MM/YYYY')); 
-- INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (2,TO_DATE('17-04-2020','DD/MM/YYYY'),4,TO_DATE('30-03-2021', 'DD/MM/YYYY'),6,3509,12,TO_DATE( '01-04-2022', 'DD/MM/YYYY')); 
-- -- CUST 15 TRIAL       
-- INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1,TO_DATE('19-01-2021', 'DD/MM/YYYY'),6,1735,15,TO_DATE('02-07-2021', 'DD/MM/YYYY'));
-- INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),3,TO_DATE('19-01-2021', 'DD/MM/YYYY'),6,1735,15,TO_DATE('14-10-2021', 'DD/MM/YYYY'));
-- cust 17 trial
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (7,TO_DATE('21-11-2021', 'DD/MM/YYYY'),2,TO_DATE('13-02-2020', 'DD/MM/YYYY'),6,3177,17,TO_DATE( '07-03-2021', 'DD/MM/YYYY')); 
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (14,TO_DATE('20-09-2020', 'DD/MM/YYYY'),1,TO_DATE('13-02-2020', 'DD/MM/YYYY'),6,3177,17,TO_DATE( '07-12-2020', 'DD/MM/YYYY')); 
-- cust 5 trial 
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (13,TO_DATE('10-06-2020', 'DD/MM/YYYY'),1,TO_DATE('07-02-2021', 'DD/MM/YYYY'),6,4709,5,TO_DATE('14-06-2020', 'DD/MM/YYYY')); 
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (15,TO_DATE('14-04-2021', 'DD/MM/YYYY'),1,TO_DATE('07-02-2021', 'DD/MM/YYYY'),6,4709,5,TO_DATE('17-04-2021', 'DD/MM/YYYY'));
-- cust 18 trial 
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (11,TO_DATE('26-11-2021', 'DD/MM/YYYY'),2,TO_DATE('21-02-2021', 'DD/MM/YYYY'),6,1468,18,TO_DATE('02-12-2021', 'DD/MM/YYYY'));
INSERT INTO Redeems(course_id, launch_date, sid, b_date, package_id, cc_number, cust_id, redeem_date) VALUES (9,TO_DATE('03-01-2022','DD/MM/YYYY'),1,TO_DATE('21-02-2021', 'DD/MM/YYYY'),6,1468,18,TO_DATE('14-10-2022', 'DD/MM/YYYY'));

-- Cancels: 
--package cancellation: if fulfils condition, refund an extra session
--course offering cancellation: if fulfils condition, refund 90% of course fees
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('25-12-2021', 'DD/MM/YYYY'),0,1,1,2,9,TO_DATE('03-01-2022', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('02-01-2022', 'DD/MM/YYYY'),0,0,1,2,9,TO_DATE('03-01-2022', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('11-11-2021', 'DD/MM/YYYY'),90,0,2,3,7,TO_DATE('21-11-2021', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('15-11-2021', 'DD/MM/YYYY'),0,0,9,3,4,TO_DATE('13-04-2020', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('10-06-2020', 'DD/MM/YYYY'),90,0,15,1,14,TO_DATE('20-06-2020', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('01-11-2020', 'DD/MM/YYYY'),90,0,14,1,13,TO_DATE('10-11-2020', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('23-11-2021', 'DD/MM/YYYY'),0,0,6,2,11,TO_DATE('26-11-2021', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('25-03-2020', 'DD/MM/YYYY'),0,1,8,1,1,TO_DATE('05-04-2020', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('01-04-2020', 'DD/MM/YYYY'),0,1,14,2,4,TO_DATE('13-04-2020', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('28-06-2020', 'DD/MM/YYYY'),0,1,4,3,3,TO_DATE('07-07-2020', 'DD/MM/YYYY'));
INSERT INTO Cancels (cdate,refund_amt,package_credit,cust_id,sid,course_id,launch_date) VALUES (TO_DATE('16-11-2021', 'DD/MM/YYYY'),90,0,6,2,11,TO_DATE('26-11-2021', 'DD/MM/YYYY'));