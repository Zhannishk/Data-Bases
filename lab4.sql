--2
CREATE TABLE warehouses(
    code INT,
    location VARCHAR(255),
    capacity INT
);

CREATE TABLE boxes(
    code VARCHAR(4),
    contents VARCHAR(255),
    value INT,
    warehouse INT
);

--3
insert into warehouses(code, location, capacity)
values (1, 'Chicago', 3);
insert into warehouses(code, location, capacity)
values (2, 'Chicago', 4);
insert into warehouses(code, location, capacity)
values (3, 'New York', 7);
insert into warehouses(code, location, capacity)
values (4, 'Los Angeles', 2);
insert into warehouses(code, location, capacity)
values (5, 'San Francisco', 8);

insert into boxes(code, contents, value, warehouse)
values ( 'OMN7', 'Rocks', 180, 3);
insert into boxes(code, contents, value, warehouse)
values ( '4H8P', 'Rocks', 250, 1);
insert into boxes(code, contents, value, warehouse)
values ( '4RT3', 'Scissors', 190, 4);
insert into boxes(code, contents, value, warehouse)
values ( '7G3H', 'Rocks', 200, 1);
insert into boxes(code, contents, value, warehouse)
values ( '8JN6', 'Papers', 75, 1);
insert into boxes(code, contents, value, warehouse)
values ( '8Y6U', 'Papers', 50, 3);
insert into boxes(code, contents, value, warehouse)
values ( '9J6F', 'Papers', 175, 2);
insert into boxes(code, contents, value, warehouse)
values ( 'LL08', 'Rocks', 140, 4);
insert into boxes(code, contents, value, warehouse)
values ( 'P0H6', 'Scissors', 125, 1);
insert into boxes(code, contents, value, warehouse)
values ( 'P2T6', 'Rocks', 150, 2);
insert into boxes(code, contents, value, warehouse)
values ( 'TU55', 'Papers', 90, 5);

--4
SELECT *
FROM warehouses;

--5
SELECT *
FROM boxes
WHERE value > 150;

--6
SELECT DISTINCT contents
FROM boxes;

--7
SELECT warehouse, COUNT(*) AS number_of_boxes
FROM boxes
GROUP BY warehouse;

--8
SELECT warehouse, COUNT(*) AS number_of_boxes
FROM boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

--9
INSERT INTO warehouses(code, location, capacity)
VALUES (6, 'New York', 3);

--10
INSERT INTO boxes(code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

--11
UPDATE boxes
SET value = value * 0.85
WHERE code = (SELECT code FROM boxes
                ORDER BY value DESC
                LIMIT 1 OFFSET 2);
--12
DELETE
FROM boxes
WHERE value < 150;

--13
DELETE
FROM boxes
WHERE warehouse IN(SELECT code FROM warehouses WHERE location = 'New York')
RETURNING *;