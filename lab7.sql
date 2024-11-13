--1
CREATE INDEX idx_countries ON countries(name);
--2
CREATE INDEX idx_employees_name_surname ON employees (name, surname);
--3
CREATE UNIQUE INDEX ind_employees_salaries ON employees(salary);
--4
CREATE INDEX idx_employees_substring ON employees(substring(name from 1 to 4))
--5
CREATE INDEX idx_employees_departments_salary_budget ON employees (department_id, salary);
CREATE INDEX idx_departments_budget ON departments (budget);