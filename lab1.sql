--1
CREATE TABLE users ( 
    id INT PRIMARY KEY, 
    firstname VARCHAR(50), 
    lastname VARCHAR(50)
);
--2
ALTER TABLE users
ADD COLUMN isadmin INTEGER;
--3
ALTER TABLE users
ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING (isadmin::BOOLEAN);
--4
ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;
--5
CREATE TABLE tasks (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    user_id INT
);
--6
DROP TABLE tasks;
--7
DROP DATABASE lab1;
