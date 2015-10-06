# ---Lyle A. Stewart
# ---Here I create an SQL Database with multiple tables. I also enter the data and query it in different ways.

#---(1) Create Table 

CREATE TABLE StudentTest(first_name VARCHAR(30) NOT NULL, last_name VARCHAR(30), email VARCHAR(60) NULL, street VARCHAR(50) NOT NULL, city VARCHAR(40) NOT NULL, state CHAR(2) NOT NULL DEFAULT "PA", zip MEDIUMINT UNSIGNED NOT NULL, phone VARCHAR(20), birth_date DATE NOT NULL, sex ENUM('M','F') NOT NULL,date_entered TIMESTAMP, luch_cost FLOAT NULL, student_if INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

# ---Remember a table is like a python library in many senses. Here I create a table. 
# ---Remember that NOT NULL guarantees that the data is in the data set. Required Data. 
# ---Remember VARCHAR() is a variable number of characters and is a data set. 
# ---CHAR() is the explicit version of VARCHAR 
# ---Default value for state is PA 
#--- ENUM : enumerated : I know that my choices will be either "M" or "F" so ENUM
#---I Use FLOAT on lunch_cost because I have decimal values 

#---(2) Verify That Your Original Query Executed Properly

SHOW TABLES; 
DESCRIBE studenttest; 

#---(3) Insert Data Into Table and Check Your Code 

INSERT INTO studenttest VALUE ('Lyle','stewart','stewartlylea@gmail.com', '7139 Naturez Road', 'Laurel', 'MA', 99881, '240-595-0300', "1995-1-31",'M',NOW(), 3.50, NULL); 
INSERT INTO studenttest VALUE('Watson','Diggs','watsondiggs@gmail.com', 'Nupe 1911 Road', 'Bloomington', 'IA', 12345, '301-982-4545',"1911-1-23", 'M',NOW(),3.50, NULL);
SELECT * FROM studenttest;

#---(4) Repeat Steps 1-3 and create remaining tables 

CREATE TABLE class(name VARCHAR(30) NOT NULL,class_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
INSERT INTO class VALUES ('English',NULL), ('Speech',NULL), ('Literature', NULL), ('Algebra', NULL), ('Geometry',NULL); 
SELECT * FROM class;

#----

CREATE TABLE test(date DATE NOT NULL,type ENUM('T','Q')NOT NULL,class_id INT UNSIGNED NOT NULL, test_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
INSERT INTO test VALUES ('2014-8-25','Q',15,1,NULL),('2014-8-27', 'Q', 15,1,NULL),('2014-8-29', 'T', 30, 1, NULL),('2014-8-29', 'T', 30, 2, NULL),('2014-8-27', 'Q', 15, 4, NULL),('2014-8-29', 'T', 30, 4, NULL);
SELECT * FROM test;

#----

CREATE TABLE score (student_id INT UNSIGNED NOT NULL, event_id INT UNSIGNED NOT NULL, score INT NOT NULL, PRIMARY KEY(event_id, student_id));
INSERT INTO score VALUES (1,1,15),(1,2,14),(1,3,28);
SELECT * FROM score;

#----

CREATE TABLE absence( student_id INT UNSIGNED NOT NULL, date DATE NOT NULL, PRIMARY KEY(student_id, date));
INSERT INTO absence VALUES(6,'2014-08-29'),(7,'2014-08-29');
SELECT * FROM table;

#---(5) Query The Data In Various Ways To Answer Questions 

#------a. Add a column to the test table | then check to see if it works 
ALTER TABLE test ADD maxscore INT NOT NULL AFTER type; 
DESCRIBE test; 

#------b. List all of your students and list first and last name 
SELECT FIRST_NAME, last_name FROM student; 

#------c. Remane a table 
RENAME TABLE absence to absences;

#------d. Select all students who are from MA and list first and last name 
SELECT first_name, last_name, state FROM studenttest WHERE state = "MA";

#------e. Select students and, list first and last names, who are born after or on 1911 
SELECT first_name, last_name, birth_date FROM studenttest WHERE YEAR(birth_date) >= 1911;

#------f. Select students and list first and last name who were born in february or, and, not, in state of MA
     #------i. 
SELECT first_name, last_name, birth_date FROM studenttest WHERE MONTH(birth_date)=2 OR state = "MA";
     #------ii.
SELECT first_name, last_name, birth_date FROM studenttest WHERE MONTH(birth_date)=2 AND state = "MA";
     #------iii.
SELECT first_name, last_name, birth_date FROM studenttest WHERE MONTH(birth_date)=2 NOT state = "MA";
    
#------g. select students first and last name who were born on or after the first and in state of MA or IL
SELECT first_name, last_name, birth_date FROM studenttest WHERE DAY(birth_date) >= 1 && (state = "MA"|| state= "IL"); 

#------h. Determine if a value was entered.. if a value is null
SELECT last_name FROM studenttest WHERE last_name IS NULL;
SELECT last_name FROM studenttest WHERE last_name IS NOT Null; 

#------i. Order Data Alphabetically 
SELECT first_name, last_name
FROM studenttest ORDER BY last_name; 
#------ alphabetical

SELECT first_name, last_name 
FROM studenttest ORDER BY column_name DESC; 
#------reverse alphabetical 
#------desc means descending

#------j. Concatenate Your Data So That It Looks Cleaner 
SELECT CONCAT(first_name, " ", last_name) AS 'Name', CONCAT(city, ",", state) AS 'Hometown' FROM studenttest; 

#------k. Limit your data query to a certain number of results
SELECT first_name, last_name FROM studenttest LIMIT 2;

#------l. Use data that meets certain constraints. I.e students whose first name is 4 letters and ends with y
SELECT last_name, first_name FROM studenttest WHERE first_name LIKE '---y'; 

#------m. Use data that meets constraints. i.e students whose first name starts with d or last name ends with n 
FROM studenttest WHERE first_name LIKE 'D%' OR last_name LIKE '%n';

#------n. Count and Distinct
SELECT DISTINCT state FROM studenttest ORDER BY state; 
#------ this prints all of the states that students are from 

SELECT COUNT(DISTINCT state) FROM students; 
#------ this will print how many states are represented total

SELECT COUNT(*) FROM studenttest; 
#------this will count all of the students in total 

SELECT COUNT(*) FROM studenttest WHERE sex='M'
#------ this will count all of the boys 

SELECT COUNT(*) FROM studenttest GROUP BY sex; 
#------ this will count all students but order the result of the query by sex. 
#------ GROUP BY defines how the results will be grouped 

SELECT MONTH(birth_date) As 'Month', COUNT(*) FROM studenttest GROUP BY Month ORDER BY Month; 
#------ allows you to narrow the results after the query is executed

#------o. Print off min max, range, and mean of test scores. 
SELECT test_id AS 'Test', MIN(score) AS min, MAX(score) AS max, MAX(score)-MIN(score) AS 'range', SUM(score) AS total, AVG(score) AS average FROM score GROUP BY test_id;


