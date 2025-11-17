--2
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(30),
    region_id INT,
    population INT
);
--3
INSERT INTO countries(country_name, region_id, population) VALUES ('Kazakhstan', 1, 19000000);
--4
INSERT INTO countries(country_id, country_name) VALUES (2, 'Russia');
--5
INSERT INTO countries(region_id) VALUES (null);
--6
INSERT INTO countries(country_name, region_id, population) VALUES ('Uzbekistan', 3, 33000000),
                                                                  ('China', 4, 1300000000),
                                                                  ('USA', 5, 500000000);
--7
ALTER TABLE countries
ALTER COLUMN country_name
SET DEFAULT 'Kazakhstan';
--8
INSERT INTO countries(region_id, population) VALUES (6, 1234000);
--9
INSERT INTO countries DEFAULT VALUES;
--10
CREATE TABLE countries_new (LIKE countries);
--11
INSERT INTO countries_new SELECT * FROM countries;
--12
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;
--13
SELECT
    country_name,
    population * 1.10 AS "New Population"
FROM
    countries;
--14
DELETE FROM countries WHERE population < 100000;
--15
WITH deleted_data AS (
    DELETE FROM countries_new
        WHERE country_id IN (SELECT country_id FROM countries)
        RETURNING *
)
SELECT * from deleted_data;
--16
WITH deleted_rows AS(
    DELETE FROM countries
    RETURNING *
)
SELECT * from deleted_rows;
