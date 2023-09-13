# SP23: APPLIED DATABASE TECHNOLOGIES
# Week-11 Final Project – Phase-2 
# Project Title: Blood Link: Blood Bank Management and Monitoring System 
# Team Memeber: Aniruddho Chatterjee, Jerin Easo Thomas, Shreya Mariam Varghese 


##------Section 1. Creation of tables-------

-- Section 1 Code Authorship : Shreya Mariam Varghese - svarghe
## Donor Table - Code Authorship : Shreya Mariam Varghese - svarghe
CREATE TABLE Donor (
DonorId INT PRIMARY KEY NOT NULL,
Name CHAR(200) NOT NULL,
Contact BIGINT(50) NOT NULL,
Email VARCHAR(200) NOT NULL,
BloodType VARCHAR(200) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(200) NOT NULL,
Address VARCHAR(200) NOT NULL
);

## Recipient Table - Code Authorship : Shreya Mariam Varghese - svarghe
CREATE TABLE Recipient (
RecipientId INT PRIMARY KEY NOT NULL,
Name CHAR(200) NOT NULL,
Contact BIGINT(50) NOT NULL,
Email VARCHAR(200) NOT NULL,
RequiredBloodType VARCHAR(200) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(200) NOT NULL,
Address VARCHAR(200) NOT NULL
);


## BloodBank Table - Code Authorship : Shreya Mariam Varghese - svarghe
CREATE TABLE BloodBank (
BloodBankId INT PRIMARY KEY NOT NULL,
Name VARCHAR(200) NOT NULL,
Contact VARCHAR(200),
Helpline VARCHAR(200),
Address VARCHAR(200),
State VARCHAR(200) NOT NULL,
District VARCHAR(200) NOT NULL,
City VARCHAR(200) NOT NULL,
Pincode BIGINT(50),
Fax VARCHAR(200),
Website VARCHAR(200),
Category VARCHAR(200),
ServiceTime VARCHAR(200)
);

## Appointment Table - Code Authorship : Shreya Mariam Varghese - svarghe
CREATE TABLE Appointment (
AppointmentId INT PRIMARY KEY NOT NULL,
DonorId INT,
RecipientId INT,
BloodBankId INT NOT NULL,
Date DATE NOT NULL,
Time TIME NOT NULL,
FOREIGN KEY (DonorId) REFERENCES Donor(DonorId),
FOREIGN KEY (RecipientId) REFERENCES Recipient(RecipientId),
FOREIGN KEY (BloodBankId) REFERENCES BloodBank(BloodBankId)
);

## BloodSample Table - Code Authorship : Shreya Mariam Varghese - svarghe

CREATE TABLE BloodSample (
SampleId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
DonorId INT NOT NULL,
BloodBankId INT NOT NULL,
CollectionDate DATE NOT NULL,
ExpirationDate DATE NOT NULL,
BloodType VARCHAR(200) NOT NULL,
HaemoglobinLevel VARCHAR(200),
RBCCount VARCHAR(200),
WBCCount VARCHAR(200),
Quantity INT(50),
FOREIGN KEY (DonorId) REFERENCES Donor(DonorId),
FOREIGN KEY (BloodBankId) REFERENCES BloodBank(BloodBankId)
);

## BloodTransfusion Table - Code Authorship : Shreya Mariam Varghese - svarghe

CREATE TABLE BloodTransfusion (
TransfusionId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
BloodBankId INT NOT NULL,
RecipientId INT NOT NULL,
SampleId INT NOT NULL,
TransfusionDate DATE NOT NULL,
BloodType VARCHAR(200) NOT NULL,
TransfusedQuantity VARCHAR(200),
TransfusionStatus VARCHAR(200) NOT NULL,
FOREIGN KEY (RecipientId) REFERENCES Recipient(RecipientId),
FOREIGN KEY (BloodBankId) REFERENCES BloodBank(BloodBankId),
FOREIGN KEY (SampleId) REFERENCES BloodSample(SampleId)
);

## Inventory Table - Code Authorship : Shreya Mariam Varghese - svarghe
CREATE TABLE Inventory (
BloodBankId INT NOT NULL,
BloodType VARCHAR(200) NOT NULL,
Quantity INT(200)NOT NULL,
FOREIGN KEY (BloodBankId) REFERENCES BloodBank(BloodBankId)
);

## Nodal Table - Code Authorship : Shreya Mariam Varghese - svarghe
CREATE TABLE Nodal (
BloodBankId INT NOT NULL,
OfficerName VARCHAR(200) NOT NULL,
OfficerContact VARCHAR(200),
OfficerEmail VARCHAR(200),
OfficerQualification varchar(200)
);

#Code Authorship : Shreya Mariam Varghese - svarghe
## Drop Table Commands
DROP table Inventory;
DROP table Appointment;
DROP table BloodTransfusion;
DROP table Donor;
DROP table Recipient;
Drop table Nodal; 
Drop table mastertable;
DROP table BloodSample;
DROP table BloodBank;



##------Section 2. Project functionality along with Insert,Update and Delete Commands-----

-- Section2. Code Authorship : Jerin Easo Thomas - jerithom

## BloodBank Insert, Update, Truncate and Delete Commands 

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
ALTER TABLE BloodBank    
MODIFY Contact VARCHAR(100), 
MODIFY Helpline VARCHAR(100);  

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
SELECT * FROM BloodBank
where State = 'Maharashtra' and city = 'Aurangabad';

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
TRUNCATE TABLE BloodBank;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
delete from BloodBank
where 1=1;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodBank
SELECT Sr_No, Blood_Bank_Name, concat(Contact_No, ', ', Mobile) as Contact, Helpline, Address, State, District, City, Pincode, Fax, Website, Category, Service_Time
FROM blood_bank_mastertable;


## Blood Tranfusion Insert commands

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodTransfusion (TransfusionId, BloodBankId, RecipientId, SampleId, TransfusionDate, BloodType, TransfusedQuantity, TransfusionStatus)
VALUES (1, 1300, 1, 1, '2023-04-01', 'B+', 1, 'Complete');

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select RequiredBloodType from Recipient where RecipientId is not null;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from BloodTransfusion;


##Inventory Table Insert and Delete Commands

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
DELETE FROM Inventory;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Inventory (BloodBankId, BloodType, Quantity)
select A.BloodBankId, BloodType, sum(Quantity) as Quantity
from BloodBank A
INNER JOIN 
BloodSample B
on A.BloodBankId = B.BloodBankId
group by 1,2;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from Inventory;

## Nodal Table Insert and Delete Commands

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
SELECT * FROM Nodal;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
delete from Nodal
where (OfficerName = '' or OfficerName = 'NA' or OfficerName = 'Dr.' or OfficerName = 'N/A');

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Nodal
select Sr_No, Nodal_Officer, concat(Contact_Nodal_Officer, ', ', Mobile_Nodal_Officer) as OfficerContact, Email_Nodal_Officer, Qualification_Nodal_Officer
from blood_bank_mastertable;



## Data Insert to blood_bank_mastertable, the csv data for which is taken from Kaggle and inserted into BloodBank Table

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from blood_bank_mastertable;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
UPDATE blood_bank_mastertable SET Contact_No = CONCAT(Contact_No, ', ', Mobile);

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select Contact_No, Mobile, concat(Contact_No, ', ', Mobile) as Contact from blood_bank_mastertable;


## ---------Blood Donation process.-----------
##Initially the donor would have to create an account and the data for which would be inserted in the donor table.

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Donor (DonorId, Name, Contact, Email, BloodType, DOB, Gender, Address)
VALUES (2, 'Shreya Varghese', 8256748193, 'svarge@gmail.com', 'A+', '1999-04-17', 'Female', 'Thane, Mumbai, Maharashtra, India'),
(3, 'Chaitrali Ghanekar', 9215674712, 'chaitu@gmail.com', 'B+', '2000-04-20', 'Female', 'Karvenagar, Pune, Maharashtra, India'),
(4, 'Sushant Menon', 982279745, 'sushantmenon.com', 'A+', '2000-01-19', 'Male', 'Dandibeach, Surat, Gujarat, India'),
(5, 'Sakshi Sitoot', 936758123, 'ssitoot.com', 'AB+', '1997-10-31', 'Female', 'Meera Road, Surat, Maharashtra, India');

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Donor (DonorId, Name, Contact, Email, BloodType, DOB, Gender, Address)
VALUES (6, 'Vicktor Dennis', 8192481950, 'vdennis@gmail.com', 'O+', '1997-06-12', 'Male', 'Camp, Pune, Maharashtra, India'),
(7, 'Yash Vibhute', 9876541236, 'yash12@gmail.com', 'B+', '2000-06-14', 'Male', 'Chinchwad, Pune, Maharashtra, India'),
(8, 'Saurav', 8127784371, 'saurav98@gmail.com', 'AB-', '1998-10-07', 'Male', 'Hyderabad, India'),
(9, 'Atharv Bagade', 8135671034, 'atharvbagade@gmail.com', 'A-', '1998-11-24', 'Male', 'Andheri, Mumbai, Maharashtra, India'),
(10, 'Bhargave Desai', 9912674123, 'bdesai@gmail.com', 'O-', '1997-4-30', 'Male', 'Mumbai, Maharashtra, India');

## Once data is inserted the donor would have to crete an appointment to a particular hospital and the data for which 
## would be inserted in Appointment table


## Below code is to insert records into appointment table for both Donor and Receipient, it also includes some update queries.

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
ALTER TABLE Appointment DROP FOREIGN KEY appointment_ibfk_1;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
ALTER TABLE Appointment
ADD CONSTRAINT FOREIGN KEY (RecipientId) REFERENCES Recipient(RecipientId);

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
ALTER TABLE Appointment
ADD CONSTRAINT appointment_ibfk_3
FOREIGN KEY (BloodBankId) REFERENCES BloodBank(BloodBankId);

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Appointment (AppointmentId, DonorId, BloodBankId, Date, Time)
VALUES (1, 1, 1298, '2023-04-04', '16:00:00');

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Appointment (AppointmentId, DonorId, BloodBankId, Date, Time)
VALUES (4, 3, 1271, '2023-02-14', '09:00:00'),
(5, 4, 1269, '2022-12-22', '16:15:00'),
(6, 5, 1287, '2022-11-21', '12:00:00'),
(7, 6, 1273, '2023-01-07', '10:45:00'),
(8, 7, 1271, '2023-03-25', '13:00:00'),
(9, 8, 1292, '2022-10-01', '15:30:00'),
(10, 9, 1301, '2023-2-07', '8:45:00'),
(11, 10, 1299, '2023-04-02', '10:15:00');

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from Appointment;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
delete from Appointment
where AppointmentID = 1;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Appointment (AppointmentId, DonorId, RecipientId, BloodBankId, Date, Time)
SELECT 2, 2, -999, BloodBankId, '2023-04-05', '13:00:00'
  FROM BloodBank
 WHERE BloodBankId = '1297'
 LIMIT 1;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom 
SELECT constraint_name
FROM information_schema.table_constraints
WHERE table_name = 'Appointment'
AND constraint_type = 'FOREIGN KEY';

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from Donor;

## After appointment scheduling the Donor can now donot the blood at the respective Blood Bank and the data for the blood sample would be inserted in BloodSample table.
## Insert Queries provided below. 

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodSample (SampleId, DonorId, BloodBankId, CollectionDate, ExpirationDate, BloodType, Quantity)
VALUES (1, 1, 1298, '2023-04-04', '2023-07-03', 'B+', 1);

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodSample (SampleId, DonorId, BloodBankId, CollectionDate, ExpirationDate, BloodType, Quantity)
VALUES (2, 2, 1297, '2023-03-31', '2023-06-30', 'A+', 2);

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodSample (SampleId, DonorId, BloodBankId, CollectionDate, ExpirationDate, BloodType, Quantity)
VALUES (3, 3, 1271, '2023-03-31', '2023-06-30', 'A+', 2);

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodSample (DonorId, BloodBankId, CollectionDate, ExpirationDate, BloodType, Quantity)
SELECT A.DonorId, A.BloodBankId, A.Date as CollectionDate, DATE_ADD(A.Date, INTERVAL 180 DAY) AS  ExpirationDate, B.BloodType, 1 AS Quantity
FROM Appointment A
INNER JOIN
Donor B
ON A.DonorId = B.DonorId
where A.DonorId > 3;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from BloodSample;

## After the data has been added in the BloodSample table the Invertory table is updated. 


# ---------Blood tranfusion/receiving process--------

## Initially the recipeint would have to create and a check in the inventory if the required blood type is 
## avaiable in the particular bank 

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from Recipient;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Recipient (RecipientId, Name, Contact, Email, RequiredBloodType, DOB, Gender, Address)
VALUES (1, 'Ani Chatterji', 9998765381, 'anichat@gmail.com', 'B+', '1998-01-21', 'Male', 'Baner, Pune, Maharashtra, India');

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Recipient (RecipientId, Name, Contact, Email, RequiredBloodType, DOB, Gender, Address)
VALUES (2, 'Sarfaraz', 9998765413, 'sarfaraz@gmail.com', 'A+', '1998-09-14', 'Male', 'Baner, Pune, Maharashtra, India');


## Inventory view 
#Section2. Code Authorship : Jerin Easo Thomas - jerithom
create view ViewInventory as 
select I.BloodBankId,B.Name,B.Contact,B.State, B.City, I.BloodType, I.Quantity
from Inventory I
inner join 
BloodBank B
on I.BloodBankId = B.BloodBankId;

## Based on the inventory the recipient as to book an appointment at the Blood Bank.
#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from Appointment where AppointmentID = 2;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from ViewInventory where BloodBankId = 1297;

## After making an appointment an entry to BloodTransfusion would be made with status as Initiated.
#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO BloodTransfusion(BloodBankId, RecipientId, SampleId, TransfusionDate, BloodType, TransfusedQuantity, TransfusionStatus)
select A.BloodBankId,A.RecipientId,B.SampleId, A.Date, R.RequiredBloodType, 1 as TransfusedQuantity, 'Initiated' as TransfusionStatus
from Appointment A
inner join 
Recipient R
inner join (select SampleId from BloodSample where BloodBankId = '1297' limit 1) B
on A.RecipientId = R.RecipientId
where A.RecipientId = 2;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from BloodTransfusion;


## Once Blood has been Tranfused the hospital user can update the Sample quatity 

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from BloodSample;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
update BloodSample set Quantity = 1
where BloodBankId = 1297;

## Once Sample has been update then update the Inventory Table. 

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from Inventory;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
DELETE FROM Inventory;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
INSERT INTO Inventory (BloodBankId, BloodType, Quantity)
select A.BloodBankId, BloodType, sum(Quantity) as Quantity
from BloodBank A
INNER JOIN 
BloodSample B
on A.BloodBankId = B.BloodBankId
group by 1,2;

#Section2. Code Authorship : Jerin Easo Thomas - jerithom
select * from ViewInventory;




##------- Section 3. Views created------

-- Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 

# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
CREATE OR REPLACE VIEW INVENTORYVIEW AS 

# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
SELECT bb.BloodBankId,bb.name,bb.contact,bb.helpline,bb.email 
,bb.address,bb.state,bb.state,bb.district,bb.city,bb.pincode,bb.website,inv.BloodType,inv.Quantity 
FROM BloodBank bb 
join inventory inv 
on bb.BloodBankId = inv.BloodBankId; 

  
-- View to check appointments of Donors 
# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
CREATE OR REPLACE VIEW DonorAppointmentView AS 

# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
SELECT don.name,don.contact,don.BloodType,don.gender,app.appointmentDate,app.appointmentTime  
from Appointment app 
join Donor don 
on app.donorId=don.donorId; 

-- View to check appointments of Recipients 
# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
CREATE OR REPLACE VIEW DonorAppointmentView AS 

# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
SELECT rec.name,rec.contact,rec.BloodType,rec.gender,rec.appointmentDate,rec.appointmentTime  
from Appointment app 
join Recipients rec 
on app.recipientId=rec.recipientId; 

-- Update to be called from Blood Bank Employees while collecting blood samples from Donor. 
# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
update BloodSample set CollectionDate=curdate(),ExpirationDate=curdate()+180,BloodType=bloodType 
,HaemoglobinLevel=Hlevel,RBCCount=RBCCnt,WBCCount=WBCCnt,Quantity=BloodQuantityDonated 
where SampleID=sampleId and DonorId=donorId and bloodBankId=bloodBankId; 

  
-- Update to be called when the the blood has been collected from the donor to increase the inventory and show the same to recipients 
# Section 3. Code Authorship : Aniruddho Swapan Chatterjee - caswapan 
update Inventory set Quantity=Quantity+BloodQuantityDonated where BloodBankId=bloodBankId; 
