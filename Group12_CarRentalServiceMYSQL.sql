-- Group No : 12 CerRentalService

CREATE DATABASE CarRentalService;

-- CREATE TABLES-------------------------------------------------------------------

-- Create employee table
CREATE TABLE EMPLOYEE(
Em_ID varchar(10)  NOT NULL,
Job varchar(10) NOT NULL,
JoinDate DATE,
PRIMARY KEY (Em_ID)
);

-- Create EMPLOYEE_DETAILS table
CREATE TABLE EMPLOYEE_DETAILS(
Em_ID varchar(10)  NOT NULL,
F_Name varchar(10) NOT NULL,
L_Name varchar(20),
Province varchar(15) NOT NULL,
State varchar(10) NOT NULL,
ContactNo_1 varchar(20) NOT NULL,
ContactNo_2 varchar(20),
ContactNo_3 varchar(20),
DateOfBirth date NOT NULL,
PRIMARY KEY (Em_ID)
);

-- Create LOCATION table
CREATE TABLE LOCATION(
L_Name varchar(10)  NOT NULL,
District varchar(10) NOT NULL,
Town varchar(20),
ContactNo_1 varchar(20) NOT NULL,
ContactNo_2 varchar(20),
ContactNo_3 varchar(20),
PRIMARY KEY (L_Name,District)
);

-- Create VEHICLE_TYPE table
CREATE TABLE VEHICLE_TYPE(
VehicleTypeCode varchar(10)  NOT NULL,
TypeName varchar(10) NOT NULL,
Max_weight integer NOT NULL,
Max_Passenger integer NOT NULL,
Vehicle_Modle varchar(10) NOT NULL,
PRIMARY KEY (VehicleTypeCode)
);

-- Create JOB table
CREATE TABLE JOB(
Job_ID VARCHAR(10) NOT NULL,
Department VARCHAR(10) NOT NULL,
License_No VARCHAR(10) NOT NULL,
Salary INTEGER NOT NULL,
PRIMARY KEY(Job_ID)
);

-- Create VEHICLE table
CREATE TABLE VEHICLE(
Vehicle_No VARCHAR(10) NOT NULL,
Model VARCHAR(10) NOT NULL,
Fuel_type VARCHAR(10) NOT NULL,
Max_Passengers INTEGER NOT NULL,
Colour1 VARCHAR(10) NOT NULL,
Colour2 VARCHAR(10) NOT NULL,
Colour3 VARCHAR(10) NOT NULL,
Owner_ID VARCHAR(10) NOT NULL,
PRIMARY KEY(Vehicle_No)
);

-- Do some modifications in the VEHICLE table
ALTER TABLE VEHICLE
ADD Tyres BOOLEAN DEFAULT TRUE;

ALTER TABLE VEHICLE
ADD License_Insurance BOOLEAN DEFAULT 1;

-- Create BOOK table
CREATE TABLE BOOK(
Book_No VARCHAR(10) NOT NULL,
DriverLicense_No VARCHAR(10) NOT NULL,
Start_meter INTEGER NOT NULL,
End_meter INTEGER NOT NULL,
Booking_Type VARCHAR(10) NOT NULL,
Start_Date DATE NOT NULL,
End_Date DATE NOT NULL,
Vehicle_No VARCHAR(10) NOT NULL,
Location_ID VARCHAR(10) NOT NULL,
PRIMARY KEY(Book_No)
);

-- Add FullPayment column to the BOOK table
ALTER TABLE BOOK
ADD FullPayment BOOLEAN DEFAULT TRUE;

-- Create VEHICLE_OWNER table
CREATE TABLE VEHICLE_OWNER(
Owner_ID varchar(10) NOT NULL,
First_Name varchar(15) NOT NULL,
Last_Name varchar(20) NOT NULL,
ID_No varchar(15) NOT NULL,
Contact_No varchar(12) NOT NULL,
Email varchar(30) ,
Adress_Line_1 varchar(10) NOT NULL,
Adress_Line_2 varchar(10) NOT NULL,
Adress_Line_3 varchar(10) NOT NULL,
Date_of_Birth date,
Gender ENUM('Male', 'Female') NOT NULL,
PRIMARY KEY (Owner_ID)
);

-- Create PAYMENT table
CREATE TABLE PAYMENT(
Reference_No varchar(10) NOT NULL,
CardHolderName varchar(15) NOT NULL,
Card_Name varchar(10) NOT NULL,
Card_No varchar(15) NOT NULL,
Expire_Date date,
Amount integer(20) NOT NULL,
PRIMARY KEY (Reference_No)
);

-- Create CUSTOMER table
CREATE TABLE CUSTOMER(
ID_No varchar(15) NOT NULL,
First_Name varchar(15) NOT NULL,
Last_Name varchar(15) NOT NULL,
Book_No varchar(10) NOT NULL,
Contact_No varchar(12) NOT NULL,
Email varchar(30),
Adress_Line_1 varchar(10),
Adress_Line_2 varchar(10),
Adress_Line_3 varchar(10),
Date_of_Birth date,
Gender ENUM('Male', 'Female') NOT NULL,
PRIMARY KEY (ID_No)
);

-- Create EMPLOYEE_CONTACTS table
CREATE TABLE EMPLOYEE_CONTACTS(
Em_ID VARCHAR(10) NOT NULL,
ContactNo VARCHAR(10) NOT NULL,
primary KEY(Em_ID,ContactNo)
);

-- Create CUSTOMER_CONTACTS table
CREATE TABLE CUSTOMER_CONTACTS(
ID_NO VARCHAR(10) NOT NULL,
ContactNo VARCHAR(10) NOT NULL,
primary KEY(ID_NO,ContactNo)
);

-- Create VEHICLE_OWNER_CONTACTS table
CREATE TABLE VEHICLE_OWNER_CONTACTS(
Owner_ID VARCHAR(10) NOT NULL,
ContactNo VARCHAR(10) NOT NULL,
primary KEY(Owner_ID,ContactNo)
);

-- Create VEHICLE_COLOR table
CREATE TABLE VEHICLE_COLOR(
Vehicle_No VARCHAR(10) NOT NULL,
Color VARCHAR(10) NOT NULL,
primary KEY(Vehicle_No,Color)
);

-- Create BOOK_LOCATION table
CREATE TABLE BOOK_LOCATION(
Book_No VARCHAR(10) NOT NULL,
Location VARCHAR(10) NOT NULL,
primary KEY(Book_No,Location)
);

-- Create LOCATION_CONTACTS table
CREATE TABLE LOCATION_CONTACTS(
LName VARCHAR(20) NOT NULL,
LDistrict VARCHAR(20) NOT NULL,
ContactNo VARCHAR(10) NOT NULL,
primary KEY(LName,LDistrict,ContactNo)
);

-- Insert data ----------------------------------------------------------------------------------

-- Insert data to the EMPLOYEE table
INSERT INTO EMPLOYEE VALUES('EE001','Driver','2002-05-12');
INSERT INTO EMPLOYEE VALUES('EE002','Garage','2000-10-05');
INSERT INTO EMPLOYEE VALUES('EE003','Mannager','1999-05-12');
INSERT INTO EMPLOYEE VALUES('EE004','Accountant','1989-12-12');
INSERT INTO EMPLOYEE VALUES('EE005','Driver','2010-04-18');
INSERT INTO EMPLOYEE VALUES('EE006','Driver','2002-05-12');

-- Insert data to the EMPLOYEE_DETAILS table
INSERT INTO EMPLOYEE_DETAILS
VALUES('EE001','Thihara','Kumarasinghe','Central','Kandy','767525671','752148759',NULL,'1999-09-30');
INSERT INTO EMPLOYEE_DETAILS
VALUES('EE002','Kavindu','Kumarasinghe','North Western','Gampaha','772546892',NULL,NULL,'1999-09-10');
INSERT INTO EMPLOYEE_DETAILS
VALUES('EE003','Madavi','Kumarasiri','North Western','Gampaha','782543126','752548623','75845261235','1998-10-25');
INSERT INTO EMPLOYEE_DETAILS
VALUES('EE004','Pradeep','Siriwardhana','Southern','Galle','772541236',NULL,NULL,'2002-05-10');
INSERT INTO EMPLOYEE_DETAILS
VALUES('EE005','Pradeep','Siriwardhana','Southern','Galle','772541236',NULL,NULL,'2004-05-18');
INSERT INTO EMPLOYEE_DETAILS
VALUES('EE006','Nimal','Shantha','Uwa','Kegalle','702534586',NULL,NULL,'2001-05-03');

-- Insert data to the LOCATION table
INSERT INTO LOCATION
VALUES('TempleOfTheTooth','Kandy','Kandy','767525671','752514856',NULL);
INSERT INTO LOCATION
VALUES('WorldEnd','NuwaraEliya','Nuwara Eliya','772546892',NULL,NULL);
INSERT INTO LOCATION
VALUES('WorldEnd','Badulla','Diyathalawa','782543526','752548623','7584526524');
INSERT INTO LOCATION
VALUES('AdamsPeak','Rathnapura','Ampitiya','772541236',NULL,NULL);
INSERT INTO LOCATION
VALUES('GallFort','Galle','Galle','725486254',NULL,NULL);
INSERT INTO LOCATION
VALUES('Sigiriya','Dabulla','Thalathoya','702534254',NULL,NULL);

	-- Some Modifications in the LOCATION TABLE
	ALTER TABLE LOCATION
	MODIFY COLUMN L_Name VARCHAR(20);
	ALTER TABLE LOCATION
	MODIFY COLUMN District VARCHAR(20);
	ALTER TABLE LOCATION
	MODIFY COLUMN Town VARCHAR(20);

-- Insert data to the VEHICLE_TYPE table
INSERT INTO VEHICLE_TYPE
VALUES('V001','Car',200,4,'light');
INSERT INTO VEHICLE_TYPE
VALUES('V002','Van',400,8,'light');
INSERT INTO VEHICLE_TYPE
VALUES('V003','Lorry',200,10,'heavy');
INSERT INTO VEHICLE_TYPE
VALUES('V004','Bike',100,2,'light');
INSERT INTO VEHICLE_TYPE
VALUES('V005','Bicycle',50,1,'light');
INSERT INTO VEHICLE_TYPE
VALUES('V006','Bus',2000,20,'heavy');

-- Insert data to the JOB table
INSERT INTO Job
VALUES('FD-123',"Finance",'NULL',50000);
INSERT INTO Job
VALUES('DD-234',"Driving",'NULL',40000);
INSERT INTO Job
VALUES('HRD-345',"HR",'NULL',60000);
INSERT INTO Job
VALUES('SMD-456',"Selling",'NULL',90000);
INSERT INTO Job
VALUES('FD-567',"Finance",'NULL',45500);
INSERT INTO Job
VALUES('MD-678',"Mangement",'NULL',100000);
INSERT INTO Job
VALUES('HRD-789',"HR",'NULL',60000);


-- Insert data to the VEHICLE table
ALTER TABLE vehicle DROP COLUMN Tyres;
ALTER TABLE vehicle DROP COLUMN License_Insurance;
ALTER TABLE vehicle ADD Vehi_Type varchar(20);

INSERT INTO Vehicle
VALUES('MY_3645', 'Vitz', 'Petrol' ,5,'Red', 'black','White','19995131V','Car');
INSERT INTO Vehicle
VALUES('MA_3646', 'Corolla', 'Petrol','5','Gray', 'White','Green','19980406V', 'Car');
INSERT INTO Vehicle
VALUES('KA_3647', 'Land Rover', 'Diesel',5,'Gray', 'black','blue','19980929V', 'Car');
INSERT INTO Vehicle
VALUES('QS_3617', 'HIACE', 'Diesel',15,'Red', 'white','NULL','19970524V', 'VAN');
INSERT INTO Vehicle
VALUES('NM_3615', 'Baby Rosa', 'Diesel',25,'Yellow', 'White','Blue','19970201V', 'Bus');
INSERT INTO Vehicle
VALUES('TY_4256', 'CD125', 'Petrol',2,'Black', 'NULL','NULL','13332344V', 'Bike');


-- Insert data to the BOOK table
ALTER TABLE BOOK DROP COLUMN FullPayment;

INSERT INTO Book
VALUES('B001','B4593123',12,90,'ONLINE','2001-12-02','2001-12-05','MY_3645','L002');
INSERT INTO Book
VALUES('B002','A2345678',23,34,'ONLINE','2019-01-04','2021-01-09','MA_3646','L006');
INSERT INTO Book
VALUES('B003','G2349087',11,13,'ONLINE','2019-05-19','2019-05-20','KA_3647','L004');
INSERT INTO Book
VALUES('B004','I12345890',9,20,'ONLINE','2002-05-25','2002-05-23','NM_3615','L002');
INSERT INTO Book
VALUES('B005','U1239874',4,12,'ONLINE','2022-11-07','2022-11-09','TY_4256','L001');

ALTER TABLE BOOK
ADD FullPayment bool DEFAULT true;



-- Insert data to the VEHICLE_OWNER table
INSERT INTO VEHICLE_OWNER
VALUES ('AB001','Paul','Kennedy','708952356V','715789456','paul.kennedy@gmail.com','No 241','Ganemulla','Gampaha','1970-10-15',	'Male');
INSERT INTO VEHICLE_OWNER
VALUES ('AB002','Susan','White','624654865V','705423656','susan.white@gmail.com','No 333','Yakkala','Gampaha','1975-05-16','Female');
INSERT INTO VEHICLE_OWNER
VALUES ('AB003','Patrick','Jones','754621366V','775487265','patrick.jones@gmail.com','No 225','Galaha','Kandy',NULL, 'Male');
INSERT INTO VEHICLE_OWNER
VALUES ('AB004','Christopher','Benson','855465425V','768542136','christopher.benson@gmail.com','No 423','Ragama','Gampaha','1978-02-18','Male');

ALTER TABLE VEHICLE_OWNER
MODIFY COLUMN Adress_Line_2 VARCHAR(15) NOT NULL;

INSERT INTO VEHICLE_OWNER
VALUES ('AB005','Brian','Williams','726546533V','773562355','brian.williams@gmail.com','No 235','Pilimathalawa','Kandy','1988-05-19','Male');


-- Insert data to the CUSTOMER table
ALTER TABLE CUSTOMER
MODIFY COLUMN Book_No varchar(10) ;

INSERT INTO CUSTOMER
VALUES ('924654667V','Ethan','Brown',NULL,'715789415','ethan.brown@gmail.com','No 256','Nittambuwa','Gampaha','1990-10-08','Male');
INSERT INTO CUSTOMER
VALUES ('806546465V','Alexander','Adams',NULL,'705465656','alexander.adams@gmail.com','No 789','Unawatuna','Galle',NULL,'Male');
INSERT INTO CUSTOMER
VALUES ('854653432V','Jennifer','Watson',NULL,'775487258','jennifer.watson@gmail.com','No 247','Veyangoda','Gampaha','1982-11-22','Female');
INSERT INTO CUSTOMER
VALUES ('785656546V','Michael','Jordan',NULL,'768542131','micheal.joradan@gmail.com',NULL,NULL,NULL,'1970-05-21','Male');
INSERT INTO CUSTOMER
VALUES ('654656566V','Donald','Bryan',NULL,'773562427','donald.bryan@gmail.com','No 125','Galagedara','Kandy','1992-08-28','Male');

-- Insert data to the PAYMENT table
INSERT INTO PAYMENT
VALUES('REF234789','Donald','Peoples','254136987','2023-08-10',5700);
INSERT INTO PAYMENT
VALUES('REF425648','Michael','Sampath','215478569','2025-07-04',3500);
INSERT INTO PAYMENT
VALUES('REF412378','Jennifer','Commercial','213547865','2024-12-05',12000);
INSERT INTO PAYMENT
VALUES('REF475236','Alexander','Seylan','452135789','2024-09-22',6500);
INSERT INTO PAYMENT
VALUES('REF465688','Ethan','Sampath','541236789','2023-10-03', 4500);


-- Insert data to the Employee_Contacts
INSERT INTO employee_contacts VALUES('EE001','0752458751');
INSERT INTO employee_contacts VALUES('EE001','0712541256');
INSERT INTO employee_contacts VALUES('EE002','0712547852');
INSERT INTO employee_contacts VALUES('EE002','0714585566');
INSERT INTO employee_contacts VALUES('EE003','0752458751');
INSERT INTO employee_contacts VALUES('EE004','0712251256');
INSERT INTO employee_contacts VALUES('EE005','0712547852');
INSERT INTO employee_contacts VALUES('EE005','0714582546');

-- Insert data to the book_location
alter table book_location add district varchar(20);
alter table book_location modify COLUMN location varchar(20);
INSERT INTO book_location VALUES('B001','TempleOfTheTooth','Kandy');
INSERT INTO book_location VALUES('B001','AdamsPeak','Rathnapura');
INSERT INTO book_location VALUES('B002','TempleOfTheTooth','Kandy');
INSERT INTO book_location VALUES('B003','TempleOfTheTooth','Kandy');
INSERT INTO book_location VALUES('B004','WorldEnd','Badulla');
INSERT INTO book_location VALUES('B004','TempleOfTheTooth','Kandy');
INSERT INTO book_location VALUES('B005','TempleOfTheTooth','Kandy');
INSERT INTO book_location VALUES('B002','Sigiriya','Dabulla');

alter TABLE book drop COLUMN Location_ID;
alter TABLE customer drop COLUMN Contact_No;

-- Insert data to the customer_contacts
INSERT INTO customer_contacts VALUES('654656566V','0777254863');
INSERT INTO customer_contacts VALUES('654656566V','0772554863');
INSERT INTO customer_contacts VALUES('785656546V','0752254863');
INSERT INTO customer_contacts VALUES('785656546V','0775854863');
INSERT INTO customer_contacts VALUES('806546465V','0712354863');
INSERT INTO customer_contacts VALUES('854653432V','0772548863');
INSERT INTO customer_contacts VALUES('924654667V','0772554863');


-- do some updates in the CUSTOMER table
UPDATE customer set Book_No='B001' where ID_No='654656566V';
UPDATE customer set Book_No='B002' where ID_No='785656546V';
UPDATE customer set Book_No='B003' where ID_No='806546465V';
UPDATE customer set Book_No='B004' where ID_No='854653432V';
UPDATE customer set Book_No='B005' where ID_No='924654667V';

alter TABLE location
drop COLUMN ContactNo_1;
alter TABLE location
drop COLUMN ContactNo_2;
alter TABLE location
drop COLUMN ContactNo_3;

-- Insert data to the location_contacts
INSERT INTO location_contacts VALUES('AdamsPeak','Rathnapura','0775426859');
INSERT INTO location_contacts VALUES('AdamsPeak','Rathnapura','0775256859');
INSERT INTO location_contacts VALUES('GallFort','Galle','0775458859');
INSERT INTO location_contacts VALUES('Sigiriya','Dabulla','0775426859');
INSERT INTO location_contacts VALUES('Sigiriya','Dabulla','0775206859');
INSERT INTO location_contacts VALUES('TempleOfTheTooth','Kandy','0775426859');
INSERT INTO location_contacts VALUES('WorldEnd','Badulla','0775156859');
INSERT INTO location_contacts VALUES('WorldEnd','NuwaraEliya','0772526859');

alter TABLE vehicle drop COLUMN Colour1;
alter TABLE vehicle drop COLUMN Colour2;
alter TABLE vehicle drop COLUMN Colour3;

-- Insert data to the vehicle_color
INSERT INTO vehicle_color VALUES('TY_4256','Red');
INSERT INTO vehicle_color VALUES('TY_4256','White');
INSERT INTO vehicle_color VALUES('KA_3647','Black');
INSERT INTO vehicle_color VALUES('KA_3647','Yellow');
INSERT INTO vehicle_color VALUES('KA_3647','Pink');
INSERT INTO vehicle_color VALUES('MY_3645','Green');
INSERT INTO vehicle_color VALUES('QS_3617','Red');
INSERT INTO vehicle_color VALUES('NM_3615','Black');
INSERT INTO vehicle_color VALUES('NM_3615','White');

alter TABLE vehicle_owner drop COLUMN Contact_No;

-- Insert data to the vehicle_owner_contacts
INSERT INTO vehicle_owner_contacts VALUES('AB001','0712542365');
INSERT INTO vehicle_owner_contacts VALUES('AB001','0725442365');
INSERT INTO vehicle_owner_contacts VALUES('AB002','0712545265');
INSERT INTO vehicle_owner_contacts VALUES('AB002','0712514365');
INSERT INTO vehicle_owner_contacts VALUES('AB003','0745842365');
INSERT INTO vehicle_owner_contacts VALUES('AB004','0712635865');
INSERT INTO vehicle_owner_contacts VALUES('AB005','071252565');
INSERT INTO vehicle_owner_contacts VALUES('AB005','0712542325');
INSERT INTO vehicle_owner_contacts VALUES('AB003','0712525365');





-- Modifications----------------------------------------------------------------------------

-- Modification of JOB table
DELETE FROM JOB WHERE Job_ID = 'FD-123';
DELETE FROM JOB WHERE Job_ID = 'HRD-345';
UPDATE JOB SET Job_ID = 'Driving'
WHERE Job_ID = 'DD-234';
UPDATE JOB
SET Job_ID = 'Accountant'
WHERE Job_ID = 'FD-567';
UPDATE JOB
SET Job_ID = 'Mannager'
WHERE Job_ID = 'HRD-789';
UPDATE JOB
SET Job_ID = 'Owner'
WHERE Job_ID = 'MD-678';
UPDATE JOB
SET Job_ID = 'Seller'
WHERE Job_ID = 'SMD-456';
UPDATE JOB
SET Job_ID = 'Driver'
WHERE Job_ID = 'Driving';

INSERT INTO JOB
VALUES('Garage','Mechanical','B231334',40000);

alter table vehicle_type
add unique(TypeName);

alter table book
drop column customer;

Alter table BOOK
add Customer varchar(20) default '654656566V';

alter table customer
add PaymentRefference varchar(20) default 'REF234789';

select * from customer;
show create table employee;

ALTER TABLE employee
DROP FOREIGN KEY FK_EmployeeDetails;

DROP TABLE employee_details;

ALTER TABLE EMPLOYEE
ADD F_Name varchar(20) NOT NULL,
ADD L_Name varchar(20) NOT NULL,
ADD DateOFBirth date NOT NULL,
ADD Province VARCHAR(20),
ADD State VARCHAR(20);

UPDATE employee
SET F_Name='Thihara',L_Name='Kumarasinghe',DateOfBirth='1999-09-30',Province='Central',State='Kandy'
where Em_ID='EE001';

UPDATE employee
SET F_Name='Kavindu',book_locationL_Name='Kumarasinghe',DateOfBirth='1998-10-30',Province='North western',State='Gampaha'where Em_ID='EE002';

UPDATE employee
SET F_Name='Madavi',L_Name='Kumarasiri',DateOfBirth='1999-12-10',Province='North Western',State='Gampaha'
where Em_ID='EE003';

UPDATE employee
SET F_Name='Pradeep',L_Name='Kumara',DateOfBirth='1999-09-12',Province='Southern',State='Galle' where Em_ID='EE004';

UPDATE employee
SET F_Name='Kalindu',L_Name='Gamage',DateOfBirth='2002-09-30',Province='Southern',State='Galle'where Em_ID='EE005';

UPDATE employee
SET F_Name='Nimal',L_Name='Shantha',DateOfBirth='2005-04-15',Province='Uwa',State='Kegalle'where Em_ID='EE006';

UPDATE vehicle SET Owner_ID='AB001' where Vehicle_No='KA_3647';
UPDATE vehicle SET Owner_ID='AB002' where Vehicle_No='MA_3646';
UPDATE vehicle SET Owner_ID='AB003' where Vehicle_No='MY_3645';
UPDATE vehicle SET Owner_ID='AB004' where Vehicle_No='NM_3615';
UPDATE vehicle SET Owner_ID='AB005' where Vehicle_No='QS_3617';
UPDATE vehicle SET Owner_ID='AB006' where Vehicle_No='TY_4256';

insert into vehicle_owner values('AB006','Kamal','Jayasooriya','854269523V','abc@gamil.com','No 96,','Kapuruka','Thalathoua','2000-02-18','Male');

alter table customer add VehicleNo varchar(10) default 'MY_3645';
UPDATE customer SET vehicleNo='NM_3615' where ID_no='785656546V';
UPDATE customer SET vehicleNo='QS_3617' where ID_no='806546465V';
UPDATE customer SET vehicleNo='QS_3617' where ID_no='854653432V';
UPDATE customer SET vehicleNo='TY_4256' where ID_no='924654667V';

UPDATE BOOK SET customer='785656546V' where Book_No='B002';
UPDATE BOOK SET customer='854653432V' where Book_No='B004';
UPDATE BOOK SET customer='806546465V' where Book_No='B003';
UPDATE BOOK SET customer='924654667V' where Book_No='B005';

UPDATE JOB SET License_No='B1245123' where Job_ID='Seller';
UPDATE JOB SET License_No='B1223286' where Job_ID='Owner';
UPDATE JOB SET License_No='B1245656' where Job_ID='Mannager';

DELETE FROM EMPLOYEE
where Em_ID='EE006';

UPDATE CUSTOMER
SET PaymentRefference = 'REF412378' WHERE ID_No = '785656546V';
UPDATE CUSTOMER
SET PaymentRefference = 'REF425648' WHERE ID_No = '806546465V';
UPDATE CUSTOMER
SET PaymentRefference = 'REF465688' WHERE ID_No = '854653432V';
UPDATE CUSTOMER
SET PaymentRefference = 'REF475236' WHERE ID_No = '924654667V';
SELECT * FROM CUSTOMER;



-- Relationship of the CarRentalService--------------------------------------------------------------

-- Relation of EMPLOYEE table and JOB table
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EmployeeJob
FOREIGN KEY (Job) REFERENCES JOB(Job_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of EMPLOYEE table and employee_details table
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EmployeeDetails
FOREIGN KEY (Em_ID) REFERENCES employee_details(Em_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of VEHICLE table and vehicle_type table
ALTER TABLE VEHICLE
ADD CONSTRAINT FK_VehicleType
FOREIGN KEY (Vehi_Type) REFERENCES vehicle_type(TypeName)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of VEHICLE table and vehicle_owner table
ALTER TABLE VEHICLE
ADD CONSTRAINT FK_VehicleOwner
FOREIGN KEY (Owner_ID) REFERENCES vehicle_owner(Owner_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of BOOK table and vehicle table
ALTER TABLE BOOK
ADD CONSTRAINT FK_BookVehi_No
FOREIGN KEY (Vehicle_No) REFERENCES vehicle(Vehicle_No)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of BOOK table and customer table
ALTER TABLE BOOK
ADD CONSTRAINT FK_BookCustomer
FOREIGN KEY (Customer) REFERENCES customer(ID_No)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of customer table and payment table
ALTER TABLE customer
ADD CONSTRAINT FK_CustomerPay
FOREIGN KEY (PaymentRefference) REFERENCES payment(Reference_No)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of customer table and Book table
ALTER TABLE customer
ADD CONSTRAINT FK_CustomerBooking
FOREIGN KEY (Book_No) REFERENCES Book(Book_No)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of CUSTOMER table and VEHICLE table
ALTER TABLE customer
ADD CONSTRAINT FK_CustomerVehicle
FOREIGN KEY (VehicleNo) REFERENCES vehicle(Vehicle_No)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of employee_contacts table and EMPLOYEE table
ALTER TABLE employee_contacts
ADD CONSTRAINT FK_Contacts
FOREIGN KEY (Em_ID) REFERENCES EMPLOYEE(Em_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of book_location table and BOOK table
ALTER TABLE book_location
ADD CONSTRAINT FK_book_location
FOREIGN KEY (Book_No) REFERENCES BOOK(Book_No)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of book_location table and location table
ALTER TABLE book_location
ADD CONSTRAINT FK_book_location2
FOREIGN KEY (Location,District) REFERENCES location(L_Name,District)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of vehicle_owner_contacts table and vehicle_owner table
ALTER TABLE vehicle_owner_contacts
ADD CONSTRAINT FK_vehicle_owner_contacts
FOREIGN KEY (Owner_ID) REFERENCES vehicle_owner(Owner_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Relation of vehicle_color table and vehicle table
ALTER TABLE vehicle_color
ADD CONSTRAINT FK_vehicle_color
FOREIGN KEY (Vehicle_No) REFERENCES vehicle(vehicle_No)
ON DELETE CASCADE ON UPDATE CASCADE;



-- Simple queries ----------------------------------------------------------------

-- select operation
SELECT * FROM VEHICLE;
SELECT * FROM VEHICLE WHERE vehi_Type='Car';
SELECT * FROM CUSTOMER;

-- project operation
SELECT First_Name, Email, VehicleNo FROM CUSTOMER;

-- cartesian product operation
SELECT * FROM VEHICLE;

SELECT * FROM VEHICLE_COLOR;

SELECT * FROM VEHICLE CROSS JOIN VEHICLE_COLOR;

-- creating a user view
CREATE VIEW CUSTOMER_BOOKING AS SELECT First_Name,Book_No from CUSTOMER;

SELECT * FROM CUSTOMER_BOOKING;

-- renaming operation
RENAME TABLE VEHICLE_COLOR TO COLORS_VEHICLE;

SELECT * FROM COLORS_VEHICLE;

-- aggregation function  
SELECT * FROM VEHICLE
WHERE Max_Passengers = (SELECT max(Max_Passengers) from VEHICLE);

-- query to demonstrate the use of LIKE keyword
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE
WHERE L_Name like 'Kumara%';

-- Complex queries -----------------------------------------

-- union
SELECT * FROM customer;

(SELECT First_Name as Customer_Name, Adress_line_3 as City 
From customer where Adress_Line_3 = 'Gampaha')
Union
(SELECT First_Name as Customer_Name, Adress_line_3 as City 
From customer where Adress_Line_3 = 'Kandy');

-- intersect
SELECT * FROM employee;

SELECT Em_ID as Employee_ID, State as City 
From employee where Job = 'Driver' AND (State = 'Galle' OR State='Kegalle');

-- minus
SELECT * FROM payment;

SELECT CardHolderName as Customer_Name, Amount as Cash
From payment WHERE (CardHolderName,Amount)
NOT IN
(SELECT CardHolderName as Customer_Name, Amount as Cash
From payment where Card_Name = 'Sampath');

-- division
SELECT * FROM customer_contacts;

SELECT DISTINCT TMR1.ID_NO 
FROM customer_contacts TMR1 
WHERE NOT EXISTS (
  SELECT ContactNo 
    FROM customer_contacts TMR2
  where TMR2.ContactNo='0772548863' AND NOT EXISTS(
    SELECT ContactNo 
    FROM customer_contacts TMR3
    WHERE TMR3.ID_NO=TMR1.ID_NO AND TMR3.ContactNo=TMR2.ContactNo
        )
);

-- inner join 
CREATE VIEW IJ1 AS
SELECT First_Name,Last_Name, ID_No, Owner_ID 
FROM vehicle_owner;

CREATE VIEW  IJ3 AS
SELECT Owner_ID , Vehicle_No , Model, Max_Passengers FROM vehicle;

SELECT * FROM IJ1;
SELECT * FROM IJ3;

SELECT * 
FROM IJ1 as view1 
INNER JOIN IJ3 as view3
USING(Owner_ID) 
WHERE (view3.Max_Passengers > 5);
UPDATE vehicle SET Vehi_Type='Van' where Vehicle_No='QS_3617';

-- Natural Join
CREATE VIEW  NJ1 AS
SELECT Model,Vehicle_No,Fuel_type,Vehi_Type
FROM vehicle WHERE Max_Passengers>10;

CREATE VIEW  NJ2 AS 
SELECT TypeName AS 'Vehi_Type' ,Max_weight , Vehicle_Modle
FROM vehicle_type WHERE Max_weight>300;

SELECT * FROM NJ1;
SELECT * FROM NJ2;

SELECT * 
FROM NJ1 as view4 
NATURAL JOIN NJ2 as view5;

UPDATE book
SET DriverLicense_No = 'U1239874'
WHERE Book_No = 'B004';

-- RIGHT OUTER JOIN
CREATE VIEW  RJ1 AS
SELECT Job_ID,License_No, Salary
FROM job  WHERE (License_No is not null) AND (Salary<70000);

CREATE VIEW  RJ2 AS 
SELECT Job, F_Name, L_Name
FROM employee;

SELECT * FROM RJ1;
SELECT * FROM RJ2;

SELECT * 
FROM RJ1 as view8
RIGHT OUTER JOIN RJ2 as view9 on view8.Job_ID = view9.Job ;

ALTER TABLE job
CHANGE License_No License_No varchar(10);

UPDATE job
SET  License_No = NULL
WHERE Job_ID = 'Accountant';

UPDATE job
SET  License_No = NULL
WHERE Job_ID = 'Driver';

-- LEFT OUTER JOIN
CREATE VIEW  LJ1 AS
SELECT Job_ID,License_No, Salary
FROM job  WHERE (License_No is not null) AND (Salary<70000);

CREATE VIEW  LJ2 AS 
SELECT Job, F_Name, L_Name
FROM employee;

SELECT * FROM LJ1;
SELECT * FROM LJ2;

SELECT * 
FROM LJ1 as view8
LEFT OUTER JOIN LJ2 as view9 on view8.Job_ID = view9.Job ;

-- Full outer join 
create view Right_Outer_view As (SELECT * 
FROM RJ1 as view8
RIGHT OUTER JOIN RJ2 as view9 on view8.Job_ID = view9.Job );

create view Left_Outer_view As (SELECT * 
FROM LJ1 as view8
LEFT OUTER JOIN LJ2 as view9 on view8.Job_ID = view9.Job );

SELECT * FROM Right_Outer_view;
SELECT * FROM Left_Outer_view;

select * from Right_Outer_view union select * from Left_Outer_view;

-- outer union 
SELECT * FROM customer;
SELECT * FROM vehicle;
CREATE VIEW MV8 as ((SELECT * FROM NJ1 as view4 NATURAL JOIN NJ2 as view5) 
UNION
(SELECT VehicleNo,First_Name,Last_Name,Gender,Date_of_Birth,Adress_Line_1 FROM customer));

SELECT * FROM MV8;
SELECT * from MV8 LEFT JOIN vehicle using(Vehicle_No) where vehicle.Vehicle_No is  NULL;

-- Nested Quary 1
UPDATE VEHICLE_OWNER 
SET Gender='Female' WHERE Owner_ID='AB005';

SELECT * FROM VEHICLE_OWNER;
SELECT * FROM VEHICLE;

-- Let check Vehicle Number and Owner ID those owner is female
SELECT V.Vehicle_No As Vehicle_No, V.Owner_ID as Owner_Identity FROM VEHICLE AS V WHERE Owner_ID IN 
(SELECT VO.Owner_ID FROM VEHICLE_OWNER as VO WHERE VO.Gender='Female');

-- Nested Quary 2
SELECT * FROM CUSTOMER;
SELECT * FROM PAYMENT;

-- Lets retrieve customer's First names, who had paid more than Rs 5000
SELECT C.First_Name As First_Name FROM CUSTOMER AS C WHERE PaymentRefference IN 
(SELECT P.Reference_No FROM PAYMENT as P WHERE P.Amount>5000);

-- Nested Quary 3
SELECT * FROM VEHICLE;
SELECT * FROM VEHICLE_TYPE;

-- Lets check Vehicle Numbers , that can carry more than 5 passangers
SELECT V.Vehicle_No As VehicleNo FROM VEHICLE AS V WHERE Vehi_Type IN 
(SELECT VT.TypeName FROM VEHICLE_TYPE as VT WHERE VT.Max_Passenger>5);




-- Chapter 6 - Database Tuning -----------------------------------------------------------------------

-- Tunng of nested query 1
SHOW INDEX FROM VEHICLE;
SHOW INDEX FROM VEHICLE_OWNER;

EXPLAIN SELECT V.Vehicle_No As Vehicle_No, V.Owner_ID as Owner_Identity FROM VEHICLE AS V WHERE Owner_ID IN 
(SELECT VO.Owner_ID FROM VEHICLE_OWNER as VO WHERE VO.Gender='Female');

CREATE INDEX VehiNoOwnerId ON VEHICLE_OWNER(Gender);

EXPLAIN SELECT V.Vehicle_No As Vehicle_No, V.Owner_ID as Owner_Identity FROM VEHICLE AS V WHERE Owner_ID IN 
(SELECT VO.Owner_ID FROM VEHICLE_OWNER as VO WHERE VO.Gender='Female');

-- Tunng of nested query 1

SHOW INDEX FROM CUSTOMER;
SHOW INDEX FROM PAYMENT;

EXPLAIN SELECT C.First_Name As First_Name FROM CUSTOMER AS C WHERE PaymentRefference IN 
(SELECT P.Reference_No FROM PAYMENT as P WHERE P.Amount>5000);

CREATE INDEX CustomerPayment ON PAYMENT(Amount);

EXPLAIN SELECT C.First_Name As First_Name FROM CUSTOMER AS C WHERE PaymentRefference IN 
(SELECT P.Reference_No FROM PAYMENT as P WHERE P.Amount>5000);

-- Tunng of nested query 3
SHOW INDEX FROM VEHICLE;
SHOW INDEX FROM VEHICLE_TYPE;

EXPLAIN SELECT V.Vehicle_No As VehicleNo FROM VEHICLE AS V WHERE Vehi_Type IN 
(SELECT VT.TypeName FROM VEHICLE_TYPE as VT WHERE VT.Max_Passenger>5);

CREATE INDEX VehicleVehicleType ON VEHICLE_TYPE(Max_Passenger);

EXPLAIN SELECT V.Vehicle_No As VehicleNo FROM VEHICLE AS V WHERE Vehi_Type IN 
(SELECT VT.TypeName FROM VEHICLE_TYPE as VT WHERE VT.Max_Passenger>5);


-- Tunng of select operation
SHOW INDEX FROM VEHICLE;
EXPLAIN SELECT * FROM VEHICLE
WHERE vehi_Type='Car';

CREATE INDEX VehicleVehiType ON VEHICLE(vehi_Type);

EXPLAIN SELECT * FROM VEHICLE
WHERE vehi_Type='Car';


-- Tunng of demonstrate the use of LIKE keyword
SHOW INDEX FROM EMPLOYEE;
EXPLAIN SELECT * FROM EMPLOYEE
WHERE L_Name like 'Kumara%';

CREATE INDEX Em_L_Name ON EMPLOYEE(L_Name);

EXPLAIN SELECT * FROM EMPLOYEE
WHERE L_Name like 'Kumara%';

-- Tunng of aggregation function  
SHOW INDEX FROM VEHICLE;
EXPLAIN SELECT * FROM VEHICLE
WHERE Max_Passengers = (SELECT max(Max_Passengers) from VEHICLE);

CREATE INDEX VehiMaxPassenger ON VEHICLE(Max_Passengers);

EXPLAIN SELECT * FROM VEHICLE
WHERE Max_Passengers = (SELECT max(Max_Passengers) from VEHICLE);


-- Tunng of inner join
SHOW INDEX FROM IJ1;
SHOW INDEX FROM IJ3;

EXPLAIN SELECT * 
FROM IJ1 as view1 
INNER JOIN IJ3 as view3USING(Owner_ID) WHERE (view3.Max_Passengers > 5);
UPDATE vehicle SET Vehi_Type='Van' where Vehicle_No='QS_3617';

CREATE INDEX TuninInerJoin ON vehicle(Max_Passengers);

EXPLAIN SELECT * 
FROM IJ1 as view1 INNER JOIN IJ3 as view3USING(Owner_ID) 
WHERE (view3.Max_Passengers > 5);
UPDATE vehicle SET Vehi_Type='Van' where Vehicle_No='QS_3617';



-- Tuning of Natural Join
EXPLAIN SELECT * FROM NJ1 as view4 
NATURAL JOIN NJ2 as view5;

CREATE INDEX VehiTypeMAxWeight ON vehicle_type(Max_weight);

EXPLAIN SELECT * FROM NJ1 as view4 
NATURAL JOIN NJ2 as view5;



-- Tuning of UNION
SHOW INDEX FROM CUSTOMER;

EXPLAIN (SELECT First_Name as Customer_Name, Adress_line_3 as City 
From customer where Adress_Line_3 = 'Gampaha')
Union
(SELECT First_Name as Customer_Name, Adress_line_3 as City 
From customer where Adress_Line_3 = 'Kandy');

CREATE INDEX CusAddressLine3 ON customer(Adress_Line_3);

EXPLAIN (SELECT First_Name as Customer_Name, Adress_line_3 as City 
From customer where Adress_Line_3 = 'Gampaha')
Union
(SELECT First_Name as Customer_Name, Adress_line_3 as City 
From customer where Adress_Line_3 = 'Kandy');


-- Tuning of intersect
SHOW INDEX FROM employee;
EXPLAIN SELECT Em_ID as Employee_ID, State as City 
From employee where Job = 'Driver' AND (State = 'Galle' OR State='Kegalle');

CREATE INDEX EmployeeState ON employee(State);

EXPLAIN SELECT Em_ID as Employee_ID, State as City 
From employee where Job = 'Driver' AND (State = 'Galle' OR State='Kegalle');

