#simple query
#retrieves the SSN, Company Name for Employees with more than 3 years of experiance
Select SSN, Companyname  
From Employment_support 
Where WorkExperiance> 3;

#Aggregate
#Retrieves the userID and count of their emergency contacts
Select userID, count(*) 
From panic_Button 
Group by userID;

#Join
#Retrieves userID, name and ExpertID name for both in the same university
Select I.userID, I.name, A.ID, A.name, A.university 
From initial_user I inner join Application_expert A 
On I.AppliedUniversity = A.University;

#Nested
#Retrieves the neophyte user name,ID and university who is seeking co-op support from a Microsoft employee
Select UserID,name,AppliedUniversity 
From neophyte where coop_Id in 
(select coop_ID from coop_support where CompanyName = 'Microsoft');

#correlated
# Immigration expert ID, name who guides more than one person
Select I.ID,I.name  
From immigration_expert I 
Where 1 < (select count(IG.userID) from immigration_guidance IG Where I.ID = IG.ID);

#Using ALL
#Retrieves Expert name with grade A and has the highest hoursofwork
Select name 
From Expert  
Where ID in 
(select ID from participation_grade  
where Grade = 'A' and hoursofwork >= ALL  
(select hoursofwork from participation_grade where grade ='A'));

#Set Operations
#Retrieves a neophyte UserID and Name whose applied university is Georgia tech and seeks co-op support from Microsoft employee
Select UserID, Name  
From neophyte  
Where AppliedUniversity = 'Georgia Tech'
union 
Select N1.UserID,N1.Name 
FROM Neophyte N1, Coop_support C 
Where N1.coop_ID = C.coop_ID 
And C.companyName = 'Microsoft';

#select statement
#Retrieves smployee SSN, name and the count of experts taking their guidance
Select E.SSN,E.CompanyName,  
(select count(S.ID) from seeking_employment_support S where E.SSN = S.SSN ) 
as SupportNumber 
From employment_support E;

