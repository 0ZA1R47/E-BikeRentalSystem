           
# MySQL script for Database 

create database EBike;

use Ebike;

### Admin Login Credentials Table

create table userlogin(

username varchar(40) primary key unique, 

password varchar(40) not null);

insert into userlogin(username,password) values ("Ozair","1234");

insert into userlogin(username,password) values ("Admin","Admin");

### E-bike Rider Table that stores all information about Rider

create table Rider(

Rider_id int primary key Auto_increment,

first_name varchar(30) not null,

last_name varchar(30) not null,

username varchar(30) not null unique,

passwd varchar(30) not null,

DoB Date not null,

Email mediumtext not null,

CNIC int not null unique,

License_No int not null unique);

### Rider Contact Info Table

create table Contact_information(

Rider_id int,

mobile_no int not null,

foreign key (Rider_id) references Rider(Rider_Id)

);

### Ride Table that stores information about Current Ride

Create Table Ride(

Ride_id int primary key auto_increment,

Rider_id int,

GPS_Loct mediumtext,

statn_no int not null,

start_time timestamp,

end_time timestamp,

Distance varchar(30),

bill_amnt int );

Alter table Ride

modify statn_no varchar(300);

Alter table Ride

Drop column bill_amnt;

ALTER table Ride

Add bill_id int;

Alter table Ride

ADD foreign key (Rider_id) references Rider(Rider_id);

Alter table Ride

ADD foreign key (bill_id) references Billing(bill_id);

### This Table stores all the information about billing

Create Table Billing(

bill_id int primary key auto_increment,

debit_card mediumtext,

bill_amnt int,

Ride_id int,

foreign key (Ride_id) references Ride(Ride_id),

amnt_paid int,

status varchar(30)

);

Alter table Billing

Modify debit_card double;

describe Billing;

### This table stores all the information about E-bike

Create Table EBike(

Bike_no varchar(30) primary key unique,

model varchar(30),

colour varchar(30),

statn_no int,

shel_life varchar(30),

mantnc varchar(30),

battery_status varchar(30),

mileage int,

Ride_id int,

foreign key (Ride_id) references Ride(Ride_id)

);

Alter table Ebike

drop column Bike_no;

Alter table Ebike

Add column Bike_id int primary key,

Add column Bike_no varchar(30);

Alter table Ebike

Drop column Bike_id;

Alter table Ebike

Add column Bike_id int primary key auto_increment;

### This stored procedure is used to input Ride data in Ride Table and bill_amnt in Billing Table

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddRide`(

_Ride_id int ,

_statn_no varchar(300),

_start_time timestamp,

_end_time timestamp,

_bill_amnt int)

BEGIN

 if _Ride_id=0 then

 INSERT INTO Ride(Ride_id,statn_no,start_time,end_time)

 VALUES (_Ride_id,_statn_no,_start_time,_end_time);

 INSERT INTO Billing (bill_amnt)

 Values (_bill_amnt);

 end if;

END

### This stored procedure is used to insert data into billing table

CREATE DEFINER=`root`@`localhost` PROCEDURE `PayBill`(

_bill_id int,

_debit_card double,

_bill_amnt int,

_status varchar(30)

)

BEGIN

 if _bill_id=0 then

 INSERT INTO Billing(bill_id,debit_card,bill_amnt,status)

 VALUES (_bill_id,_debit_card,_bill_amnt,_status);

 end if;

END

### This stored procedure is used to insert and Update data into Rider Table

CREATE DEFINER=`root`@`localhost` PROCEDURE `RiderAddorEdit`(

_Rider_id int,

_first_name varchar(30),

_last_name varchar(30),

_username varchar(30),

_passwd varchar(30),

_DoB Date,

_Email mediumtext,

_CNIC int,

_License_No int,

_mobile_no int

)

BEGIN

 if _Rider_id= 0 then

 INSERT INTO Rider(first_name,last_name,username,passwd,DoB,Email,CNIC,License_No)

 VALUES (_first_name,_last_name,_username,_passwd,_DoB,_Email,_CNIC,_License_No);

 INSERT INTO Contact_information (mobile_no)

 VALUES (_mobile_no);

 else

 UPDATE Rider

 SET

 first_name=_first_name,

 last_name=_last_name,

 username=_username,

 passwd=_passwd,

 DoB=_DoB,

 Email=_Email,

 CNIC=_CNIC,

 License_No=_License_No

 Where Rider_id=_Rider_id;

 UPDATE Contact_information

 SET

 mobile_no=_mobile_no

 where Rider_id=_Rider_id;

 END IF;

END

### This stored procedure is used to insert and Update data into E-bike Table

CREATE DEFINER=`root`@`localhost` PROCEDURE `BikeAddorEdit`(

_Bike_id int,

_Bike_no varchar(30),

_model varchar(30),

_colour varchar(30),

_statn_no int,

_shel_life varchar(30),

_mantnc varchar(30),

_battery_status varchar(30),

_mileage int

)

BEGIN

 if _Bike_id=0 then

 INSERT INTO EBike(Bike_no,model,colour,statn_no,shel_life,mantnc,battery_status,mileage)

 VALUES (_Bike_no,_model,_colour,_statn_no,_shel_life,_mantnc,_battery_status,_mileage);

 else

 UPDATE EBike

 SET

 Bike_no=_Bike_no,

 model=_model,

 colour=_colour,

 statn_no=_statn_no,

 shel_life=_shel_life,

 mantnc=_mantnc,

 battery_status=_battery_status,

 mileage=_mileage

 WHERE Bike_id=_Bike_id;

 END IF;

END

### This stored procedure is used to Delete E-bike data by Id

CREATE DEFINER=`root`@`localhost` PROCEDURE `BikeDeleteById`(

_Bike_id int

)

BEGIN

 delete from EBike

 Where Bike_id=_Bike_id;

END

### This stored procedure is used to View E-bike data

CREATE DEFINER=`root`@`localhost` PROCEDURE `BikeViewAll`()

BEGIN

SELECT *

FROM EBike;

END

### This storec procedure is used to View E-bike data by Id

CREATE DEFINER=`root`@`localhost` PROCEDURE `BikeViewByID`(

_Bike_id int

)

BEGIN

SELECT *

FROM EBike

WHERE Bike_id=_Bike_id;

END