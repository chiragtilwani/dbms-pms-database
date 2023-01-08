drop schema pms;
create database pms;
use pms;
CREATE TABLE studentdetails (
  stid int NOT NULL AUTO_INCREMENT,
  sname varchar(30) NOT NULL ,
  usn varchar(12) NOT NULL UNIQUE,
  mobile bigint NOT NULL UNIQUE,
  email varchar(30) NOT NULL UNIQUE ,
  dob date NOT NULL,
  branch varchar(10) NOT NULL,
  cgpa float NOT NULL,
  PRIMARY KEY (stid,usn)
);



CREATE TABLE slogin (
  id int NOT NULL AUTO_INCREMENT,
  usn varchar(12) NOT NULL UNIQUE,
  pass varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usn) REFERENCES studentdetails(usn) ON DELETE CASCADE
);



CREATE TABLE admindetails (
  aid int NOT NULL AUTO_INCREMENT,
  aname varchar(30)  NOT NULL,
  email varchar(30) NOT NULL UNIQUE,
  phone bigint NOT NULL UNIQUE,
  depname varchar(10) NOT NULL,
  PRIMARY KEY (aid)
);


CREATE TABLE alogin (
  id int NOT NULL AUTO_INCREMENT,
  aname varchar(30)  NOT NULL,
  email varchar(30) NOT NULL,
  pass varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (email) REFERENCES admindetails(email) ON DELETE CASCADE
);



CREATE TABLE companydetails (
  id int NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL UNIQUE,
  cdescription  varchar(300) NOT NULL,
  email varchar(30) NOT NULL UNIQUE,
  phone bigint NOT NULL UNIQUE,
  website varchar(30) NOT NULL,
  adrs varchar(300) NOT NULL,
  package varchar(30) NOT NULL,
  mincgpa float NOT NULL,
  position varchar(50) NOT NULL,
  PRIMARY KEY (id,cname)
);



CREATE TABLE updateddrive (
  id int NOT NULL AUTO_INCREMENT,
  usn varchar(12) NOT NULL,
  sname varchar(30) NOT NULL UNIQUE,
  batch varchar(10) NOT NULL,
  cname varchar(30) NOT NULL,
  pdate date NOT NULL,
  package varchar(30) NOT NULL,
  position varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usn) REFERENCES studentdetails(usn) ON DELETE CASCADE,
  FOREIGN KEY (cname) REFERENCES companydetails(cname) ON DELETE CASCADE
);

INSERT INTO studentdetails (sname, usn, mobile, email, dob, branch, cgpa) VALUES
( 'Suryansh', '1SG20IS100', 9149256646, 'suryansh@gmai', '2001-05-16', 'ISE', 7.9),
( 'Utkarsh', '1SG20IS105', 9165487956, 'utkarsh@gmail.com', '2002-05-18', 'ISE', 8.6),
( 'Hardik', '1SG20IS035', 8756245891, 'hardik6@gmail.com', '2002-09-06', 'ISE', 8.8);


INSERT INTO slogin ( usn, pass) VALUES
('1SG20IS100', 'suryansh'),
('1SG20IS105', 'utkarsh'),
('1SG20IS035', 'hardik');


INSERT INTO admindetails (aname, email, phone, depname) VALUES
('Chirag', 'chirag@gmail.com', 1414175414, 'ISE'),
('Animesh', 'animesh@gmail.com', 5546675414, 'ISE');

INSERT INTO alogin ( aname, email, pass) VALUES
('Chirag', 'chirag@gmail.com', 'password'),
('Animesh', 'animesh@gmail.com', 'password');

INSERT INTO companydetails (cname, cdescription, email, phone, website, adrs, package, mincgpa, position) VALUES
('Amazon', 'Amazon is an American multinational technology company based in Seattle, Washington, which focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence.', 'ecr-replies@amazon.com', 8882804331, 'www.amazon.com','Amazon Development Center India Pvt Ltd., 2nd Floor, Safina Towers, Bangalore – 560052', '15-30 lakhs', '7','WEB DEVELOPER'),
('Wipro', 'Wipro Limited is an Indian multinational corporation that provides information technology, consulting and business process services.', 'ecr-replies@wipro.com', 8046726000, 'www.wipro.com','Doddakannelli, Sarjapur Road Bengaluru - 560 035, India', '10-20 lakhs', '7','WEB DEVELOPER'),
('Infosys', 'Infosys Limited, is an Indian multinational corporation that provides business consulting, information technology and outsourcing services.', 'Askus@infosys.com', 8028520362, 'www.infosys.com','Electronics City, Hosur Road, Bengaluru 560 100, India', '10-50 lakhs', '7','WEB DEVELOPER'),
('Accenture', 'Accenture plc is an American-Irish multinational professional services company.', 'xxxx@accenture.com', 8049346001, 'www.accenture.com','4/1, IBC Knowledge Park, Bannerghatta Road Bangalore, Karnataka India - 560029', '8-12 lakhs', '6.5','WEB DEVELOPER');

INSERT INTO updateddrive (usn, sname, batch, cname, pdate, package, position) VALUES
('1SG20IS105', 'Utkarsh', '2024', 'Infosys', '2021-09-28', '11,00,000', 'WEB DEVELOPER'),
('1SG20IS002', 'Aditya', '2024', 'Amazon', '2021-11-28', '19,00,000', 'WEB DEVELOPER'),
('1SG20IS035', 'Hardik', '2024', 'Wipro', '2021-11-08', '15,00,000', 'WEB DEVELOPER');



SELECT sl.usn,sd.sname,sd.mobile,sd.email,sd.dob,sd.branch,sd.cgpa
FROM slogin AS sl
INNER JOIN studentdetails AS sd ON sl.usn = sd.usn;



DELETE FROM studentdetails
WHERE sname = 'RT';

DELETE FROM studentdetails
WHERE sname IN ('Lalu','fjlg');