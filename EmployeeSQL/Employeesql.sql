CREATE TABLE department(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);
--select * from department

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--select * from dept_emp;


CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
 	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary	INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE title(
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
	
);


-- 1 -List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no

--2  List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year',hire_date) = 1986;

--3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select * from dept_manager
select * from  department
select * from employees

select dept_manager.dept_no,
department.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
from dept_manager
left join department
on dept_manager.dept_no = department.dept_no
left join employees
on dept_manager.emp_no = employees.emp_no