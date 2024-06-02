/*
-- 
   
   Project 1 - Week-1 
   SDAIA Academy - Tuwaiq Academy
          T5 BootCamp 
   prepared by Alanoud Awaji..
*/

/*
-- Query: to Creat tables 
*/
CREATE TABLE `schedule` (
  `Tripcode` varchar(10) NOT NULL,
  `DepartureCity` text NOT NULL,
  `ArrivalCity` text NOT NULL,
  `DepartureTime` text NOT NULL,
  `Distance` int NOT NULL,
  `Price` float NOT NULL,
  `SeatsAvailable` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Tripcode`)
);
CREATE TABLE `station` (
  `Stationcode` int NOT NULL,
  `Stationname` text NOT NULL,
  `City` text NOT NULL,
  `Country` text NOT NULL,
  PRIMARY KEY (`Stationcode`)
);
CREATE TABLE `ticket` (
  `TicketID` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `TripNo` varchar(255) NOT NULL,
  `ClientNo` varchar(255) NOT NULL,
  `DepartureStation` varchar(50) NOT NULL,
  `ArrivalStation` varchar(255) NOT NULL,
  `TicketPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `fk_TripNo` (`TripNo`),
  KEY `fk_DepartureStation` (`DepartureStation`),
  KEY `fk_ArrivalStation` (`ArrivalStation`),
  CONSTRAINT `fk_ArrivalStation` FOREIGN KEY (`ArrivalStation`) REFERENCES `trains` (`ArrivalStation`),
  CONSTRAINT `fk_DepartureStation` FOREIGN KEY (`DepartureStation`) REFERENCES `trains` (`DepartureStation`),
  CONSTRAINT `fk_TripNo` FOREIGN KEY (`TripNo`) REFERENCES `schedule` (`Tripcode`)
) ;
CREATE TABLE `trains` (
  `Trainno` int NOT NULL,
  `Speed` varchar(50) NOT NULL,
  `DepartureStation` varchar(255) NOT NULL,
  `ArrivalStation` varchar(255) NOT NULL,
  PRIMARY KEY (`Trainno`),
  KEY `index2` (`DepartureStation`),
  KEY `index3` (`ArrivalStation`)
);
CREATE TABLE `traveler` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `PhoneNumber` varchar(50) NOT NULL,
  `Age` int NOT NULL,
  PRIMARY KEY (`ID`)
) ;

/*
-- Query: to insert into schedule table 
*/
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP001','City A','City B','08:00 AM',100,10,'30','2022-01-01');
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP002','City B','City C','10:30 AM',150,15,'30','2022-01-01');
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP003','City C','City D','01:00 PM',200,20,'30','2022-01-01');
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP004','City B','City A','10:30 PM',100,10,'25','2022-01-02');
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP005','City C','City B','11:30 AM',150,15,'20','2022-01-03');
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP006','City D','City C','1:30 AM',200,20,'19','2022-01-03');
INSERT INTO `t5-project`.schedule (`Tripcode`,`DepartureCity`,`ArrivalCity`,`DepartureTime`,`Distance`,`Price`,`SeatsAvailable`,`Date`) VALUES ('TRP007','City A','City B','10:00 PM',100,10,'10','2020-01-04');

/*
-- Query: to insert into station table 
*/
INSERT INTO `t5-project`.station (`Stationcode`,`Stationname`,`City`,`Country`) VALUES (1,'Station A','City A','Country A');
INSERT INTO `t5-project`.station (`Stationcode`,`Stationname`,`City`,`Country`) VALUES (2,'Station B','City B','Country B');
INSERT INTO `t5-project`.station (`Stationcode`,`Stationname`,`City`,`Country`) VALUES (3,'Station C','City C','Country C');
INSERT INTO `t5-project`.station (`Stationcode`,`Stationname`,`City`,`Country`) VALUES (4,'Station D','City  D','Country D');

/*
-- Query: to insert into ticket table 
*/
INSERT INTO `t5-project`.ticket (`TicketID`,`Date`,`TripNo`,`ClientNo`,`DepartureStation`,`ArrivalStation`,`TicketPrice`) VALUES ('TRP0001','2022-01-01','TRP001','1','Station A','Station B',10.00);
INSERT INTO `t5-project`.ticket (`TicketID`,`Date`,`TripNo`,`ClientNo`,`DepartureStation`,`ArrivalStation`,`TicketPrice`) VALUES ('TRP0002','2022-01-02','TRP002','2','Station C','Station D',20.00);
INSERT INTO `t5-project`.ticket (`TicketID`,`Date`,`TripNo`,`ClientNo`,`DepartureStation`,`ArrivalStation`,`TicketPrice`) VALUES ('TRP0003','2022-01-03','TRP003','3','Station E','Station F',40.00);
INSERT INTO `t5-project`.ticket (`TicketID`,`Date`,`TripNo`,`ClientNo`,`DepartureStation`,`ArrivalStation`,`TicketPrice`) VALUES ('TRP0004','2022-02-03','TRP003','2','Station A','Station B',20.00);
INSERT INTO `t5-project`.ticket (`TicketID`,`Date`,`TripNo`,`ClientNo`,`DepartureStation`,`ArrivalStation`,`TicketPrice`) VALUES ('TRP0005','2022-01-02','TRP006','2','Station C','Station D',10.00);
INSERT INTO `t5-project`.ticket (`TicketID`,`Date`,`TripNo`,`ClientNo`,`DepartureStation`,`ArrivalStation`,`TicketPrice`) VALUES ('TRP0006','2022-04-02','TRP002','1','Station A','Station D',40.00);

/*
-- Query: to insert into trains table 
*/
INSERT INTO `t5-project`.trains (`Trainno`,`Speed`,`DepartureStation`,`ArrivalStation`) VALUES (101,'300','Station A','Station D');
INSERT INTO `t5-project`.trains (`Trainno`,`Speed`,`DepartureStation`,`ArrivalStation`) VALUES (102,'220','Station D','Station A');
INSERT INTO `t5-project`.trains (`Trainno`,`Speed`,`DepartureStation`,`ArrivalStation`) VALUES (103,'220','Station C','Station D');
INSERT INTO `t5-project`.trains (`Trainno`,`Speed`,`DepartureStation`,`ArrivalStation`) VALUES (123,'120','Station A','Station B');
INSERT INTO `t5-project`.trains (`Trainno`,`Speed`,`DepartureStation`,`ArrivalStation`) VALUES (456,'160','Station C','Station D');
INSERT INTO `t5-project`.trains (`Trainno`,`Speed`,`DepartureStation`,`ArrivalStation`) VALUES (789,'200','Station E','Station F');

/*
-- Query: to insert into traveler table 
*/

INSERT INTO `t5-project`.traveler (`ID`,`Name`,`PhoneNumber`,`Age`) VALUES (1,'John Doe','1234567890',25);
INSERT INTO `t5-project`.traveler (`ID`,`Name`,`PhoneNumber`,`Age`) VALUES (2,'Jane Doe','9876543210',30);
INSERT INTO `t5-project`.traveler (`ID`,`Name`,`PhoneNumber`,`Age`) VALUES (3,'Alex Lee','4567891230',35);
INSERT INTO `t5-project`.traveler (`ID`,`Name`,`PhoneNumber`,`Age`) VALUES (4,'Alanoud','1123456780',22);
INSERT INTO `t5-project`.traveler (`ID`,`Name`,`PhoneNumber`,`Age`) VALUES (5,'Ahmad','1133456700',33);
INSERT INTO `t5-project`.traveler (`ID`,`Name`,`PhoneNumber`,`Age`) VALUES (6,'Faris','1123456777',16);

/*
-- Query: 1.Retrieve all train information including train number, speed, and other relevant details.
*/

SELECT * FROM `t5-project`.trains;


/*
-- Query: 2. List all stations along with their station code and name.
*/

SELECT Stationcode ,Stationname FROM `t5-project`.station;

/*
-- Query: 3. Display the schedule for a specific trip, including departure city, arrival city, departure time, distance, and price.
*/

SELECT DepartureCity , ArrivalCity, DepartureTime ,Distance,price
FROM `t5-project`.schedule
Where Tripcode ='TRP002';

/*
-- Query: 4. Show traveler information such as name, phone number, and age.
*/

SELECT name,PhoneNumber,age FROM `t5-project`.traveler;

/*
-- Query: 5. Retrieve ticket information for a given date, including trip number and client number.
*/

SELECT TripNo , ClientNo FROM `t5-project`.ticket
Where date='2022-01-02';

/*
-- Query: 6. List all booked tickets for a specific client.
*/

SELECT * FROM `t5-project`.ticket
Where ClientNo='1'; 

/*
-- Query: 7. Display the available train schedules for a given date.
*/

SELECT * FROM `t5-project`.schedule
Where date='2022-01-01';

/*
-- Query: 8. Show the total number of available seats for each trip.
*/

SELECT Tripcode, sum(SeatsAvailable) as TotalAvailableSeats
FROM `t5-project`.schedule
group by Tripcode; 

/*
-- Query: 9. List all trips with their corresponding departure and arrival cities. 
*/

SELECT DepartureCity , ArrivalCity FROM `t5-project`.schedule;

/*
-- Query: 10. Display the total revenue generated from ticket sales for a specific date range.
*/

SELECT sum(TicketPrice) as TotalRevenue 
FROM `t5-project`.ticket
Where date between '2022-01-01' and '2022-04-02';

/*
-- Query: 11. Show the average speed of all trains.
*/

SELECT avg(speed) as AverageSpeed
FROM `t5-project`.trains;

/*
-- Query: 12. Retrieve the most popular departure and arrival cities based on the number of trips.
*/

SELECT CONCAT(DepartureCity, '-', ArrivalCity) AS Route, COUNT(*) AS frequency
FROM `t5-project`.schedule
GROUP BY DepartureCity, ArrivalCity
ORDER BY frequency DESC
LIMIT 1;

/*
-- Query: 13. List all trips sorted by departure time.
*/

SELECT * FROM `t5-project`.schedule
ORDER BY DepartureTime;

/*
-- Query: 14. Display the total distance traveled by each train. 
*/

SELECT TripNo, sum(distance) as TotalDistance
FROM `t5-project`.ticket , schedule
GROUP BY TripNo;

/*
-- Query: 15. Show the total number of tickets booked for each trip. 
*/

SELECT TripNo, COUNT(*) AS TotalTicketBooked
FROM `t5-project`.ticket
GROUP BY TripNo;

/*
-- To create the database I used MySQL Workbench. 
*/