CREATE DATABASE IF NOT EXISTS supportsphere;
USE supportsphere;
Create table user 
(UserId INT NOT NULL PRIMARY KEY, 
Name VARCHAR (40) NOT NULL, 
Email VARCHAR (50), 
PhoneNo VARCHAR (40), 
AppliedUniversity VARCHAR (50), 
Address VARCHAR (50), 
I20 VARCHAR (40), 
Passport VARCHAR (40));

Create table initial_user 
(UserId INT NOT NULL PRIMARY KEY, 
Name VARCHAR (40) NOT NULL, 
Email VARCHAR (40), 
PhoneNo VARCHAR (20), 
AppliedUniversity VARCHAR (50), 
Address VARCHAR (50), 
I20 VARCHAR (20), 
Passport VARCHAR (20),  
EducationDocs VARCHAR (40), 
GRE INT, 
IELTS INT, 
VisaDoc VARCHAR (40));

Create table Intermediate_user 
(UserId INT NOT NULL PRIMARY KEY, 
Name VARCHAR (40) NOT NULL, 
Email VARCHAR (40), 
PhoneNo VARCHAR (20), 
AppliedUniversity VARCHAR (50), 
Address VARCHAR (50), 
I20 VARCHAR (20), 
Passport VARCHAR (20), 
VisaStamping VARCHAR (40), 
PlaceOfDeparture VARCHAR (40), 
DateOfArrival varchar(30), 
AccomodationType CHAR (40));

Create table Coop_support 
(Coop_ID INT NOT NULL PRIMARY KEY, 
CompanyName VARCHAR (50) NOT NULL, 
Role VARCHAR (50), 
YearOfStudy INT, 
University VARCHAR (50));

Create table Neophyte 
(UserId INT NOT NULL PRIMARY KEY, 
Name VARCHAR (40) NOT NULL, 
Email VARCHAR (50), 
PhoneNo VARCHAR (20), 
AppliedUniversity VARCHAR (50), 
Address VARCHAR (50), 
I20 VARCHAR (20), 
Passport VARCHAR (20), 
CourseEnrollment CHAR (50), 
IntakeTerm CHAR (40), 
FieldOfConcern VARCHAR (50),
Coop_ID INT, 
foreign key (Coop_ID) REFERENCES Coop_support (Coop_ID) 
ON DELETE CASCADE ON UPDATE CASCADE); 

Create table Panic_button 
(UserId INT,
foreign key (UserID) REFERENCES Neophyte (UserID) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ContactName VARCHAR (40) NOT NULL, 
ContactNumber VARCHAR (20), 
Location VARCHAR (50));

Create table Employment_support 
(SSN INT NOT NULL PRIMARY KEY, 
University VARCHAR (50), 
CompanyName VARCHAR (50), 
Designation VARCHAR (40), 
WorkExperiance INT);

Create table Expert 
(ID INT NOT NULL PRIMARY KEY, 
Name VARCHAR (40) NOT NULL, 
Address VARCHAR (50), 
Email VARCHAR (50), 
University VARCHAR (50));

Create table Application_expert 
(ID INT NOT NULL PRIMARY KEY, 
Name VARCHAR (30) NOT NULL, 
Address VARCHAR (40), 
Email VARCHAR (50), 
University VARCHAR (50), 
VisaType VARCHAR (30), 
ApprovalYear INT, 
ApprovalPlace VARCHAR (30));

Create table Immigration_expert 
(ID INT NOT NULL PRIMARY KEY, 
Name VARCHAR (40) NOT NULL, 
Address VARCHAR (40), 
Email VARCHAR (40), 
University VARCHAR (50), 
ImmigrationDate INT, 
LicenseDetails VARCHAR (40), 
PointOfEntry VARCHAR (40));

Create table Adaptation_expert 
(ID INT NOT NULL PRIMARY KEY, 
Name VARCHAR (30) NOT NULL, 
Address VARCHAR (40), 
Email VARCHAR (40), 
University VARCHAR (50), 
CourseEnrolled VARCHAR (40), 
Neighbourhood VARCHAR (50), 
PartTime VARCHAR (30));

Create table Participation_grade 
(ID INT,
foreign key (ID) REFERENCES Expert (ID) 
ON DELETE CASCADE ON UPDATE CASCADE, 
HoursOfWork INT, 
Grade CHAR (5));

Create table Application_guidance 
(UserId INT,
foreign key(UserID) REFERENCES initial_user (UserID) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ID INT,
foreign key (ID) REFERENCES Application_expert (ID) 
ON DELETE CASCADE ON UPDATE CASCADE);

Create table Immigration_guidance 
(UserID INT,
foreign key(UserID) REFERENCES Intermediate_user (UserID) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ID INT,
foreign key (ID) REFERENCES Immigration_expert (ID) 
ON DELETE CASCADE ON update CASCADE);

Create table Adaptation_guidance 
(UserID INT,
foreign key(UserID) REFERENCES Neophyte (UserID) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ID INT,
foreign key (ID) REFERENCES Adaptation_expert (ID) 
ON DELETE CASCADE ON UPDATE CASCADE);

Create table Seeking_Employment_Support 
(ID INT,
foreign key (ID) REFERENCES Expert (ID) 
ON DELETE CASCADE ON UPDATE CASCADE, 
SSN INT,
foreign key (SSN) REFERENCES Employment_support (SSN) 
ON DELETE CASCADE ON UPDATE CASCADE);

 

 

 

 

 

 

 

 

 

 

 

 