create table Customer(
Customer_ID varchar(30) NOT NULL,
Password varchar(30) NOT NULL,
First_Name varchar(30)NOT NULL,
Last_Name varchar(30)NOT NULL,
Email_ID varchar(30),
Phone_No varchar(30),
Age integer,
City varchar(30),
Type varchar(30),
constraint Customer_PK  PRIMARY KEY(Customer_ID)
)

create table Vehicle(
Plate_No varchar(30)NOT NULL,
Customer_ID varchar(30)NOT NULL,
Color varchar(30),
constraint Vehicle_PK  PRIMARY KEY(Plate_No),
constraint Vehicle_FK FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_Id)
) 


create table Location(
Location_ID varchar(30),
Location_name varchar(30),
Capacity integer,
constraint Location_PK PRIMARY KEY(Location_ID)
)

create table Slot(
Slot_ID varchar(30),
Location_ID varchar(30),
Slot_no integer,
Slot_colour varchar(30),
constraint Slot_PK PRIMARY KEY(Slot_ID)
)


Create table Payment(
Payment_ID varchar(30)NOT NULL,
Amount_Without_Overtime float NOT NULL,
Amount_With_Overtime float NOT NULL,
Total_Amount  AS Amount_Without_Overtime + Amount_With_Overtime,
Payment_Mode varchar(30) NOT NULL,
Customer_ID varchar(30) NOT NULL,
constraint payment_PK PRIMARY KEY(Payment_ID),
constraint Payment_FK FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_Id)
)

create table Parking(
Entry_Time varchar(10) NOT NULL,
Exit_Time varchar(10) NOT NULL,
Parking_Date DATE NOT NULL,
Parked_Overtime varchar(30),
Plate_No varchar(30) NOT NULL,
Location_ID varchar(30) NOT NULL,
Slot_ID varchar(30) NOT NULL,
Customer_ID varchar(30) NOT NULL,
PRIMARY KEY(Plate_No,Location_ID,Entry_Time,Slot_ID, Parking_Date),
constraint Parking_FK FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
) 


select * from Customer
select * from Vehicle
select * from Location
select * from Slot
select * from payment
select * from Parking

Insert into Customer values
(),
()

Insert into Vehicle values
('BO234H','1S','Silver'),
('NY789E','1F','Black')

Insert into Slot values
('11R','1','1','Red'),
('12R','1','2','Red')

Insert into Location values
('1','Shaw','25')

Insert into Payment
values ('110',30,0,'Credit','1F'),
('111',20,0,'Debit','1S')


select * from payment
select * from Parking

Insert into parking values
('14:00', '17:00','04/23/2019','NO','BO234H','1','11R','1F'),
('9:00', '11:00','04/23/2019','NO','NY789E','1','12R','1S')


Drop table Customer
Drop table Vehicle
Drop table Location
Drop table Slot
Drop table payment
Drop table parking

DROP TRIGGER Enter_Slot
CREATE TRIGGER Enter_Slot ON Location
AFTER INSERT AS
IF @@ROWCOUNT=1
BEGIN
DECLARE @Loc_ID VARCHAR(10)
DECLARE @Slot_ID VARCHAR(10)
DECLARE @COUNT INT
SET @COUNT=1;


SELECT @Loc_ID=L.Location_ID
FROM Location L LEFT OUTER JOIN Slot S
on L.Location_ID= S.Location_ID
WHERE S.Location_ID is null

WHILE @COUNT<6
BEGIN
INSERT INTO Slot(Location_ID,Slot_ID,Slot_colour,Slot_no)
VALUES(@Loc_ID,CONCAT(@Loc_ID,@COUNT,'G'),'Green',@COUNT)

INSERT INTO Slot(Location_ID,Slot_ID,Slot_colour,Slot_no)
VALUES(@Loc_ID,CONCAT(@Loc_ID,@COUNT,'B'),'Blue',@COUNT)

INSERT INTO Slot(Location_ID,Slot_ID,Slot_colour,Slot_no)
VALUES(@Loc_ID,CONCAT(@Loc_ID,@COUNT,'R'),'Red',@COUNT)

INSERT INTO Slot(Location_ID,Slot_ID,Slot_colour,Slot_no)
VALUES(@Loc_ID,CONCAT(@Loc_ID,@COUNT,'Y'),'Yellow',@COUNT)

INSERT INTO Slot(Location_ID,Slot_ID,Slot_colour,Slot_no)
VALUES(@Loc_ID,CONCAT(@Loc_ID,@COUNT,'O'),'Orange',@COUNT)
SET @COUNT=@COUNT+1
END

END




SELECT L.Location_ID
FROM Location L LEFT OUTER JOIN Slot S
on L.Location_ID= S.Location_ID
WHERE S.Location_ID is null


INSERT INTO Location VALUES(4,'Ernie','25')
select * from Parking
delete from Parking
