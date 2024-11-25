------------------------------------
CREATE TABLE Titles (
    title_id  VARCHAR(255) PRIMARY KEY, 
    title VARCHAR(255)
);
------------------------------------
CREATE TABLE Departments (
    dept_no  VARCHAR(255) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);
------------------------------------
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY, 
    emp_title_id  VARCHAR(255), 
    birth_date DATE, 
    first_name VARCHAR(255), 
    last_name VARCHAR(255), 
    sex CHAR(1), 
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id) -- Foreign key referencing Titles
);
------------------------------------
CREATE TABLE Salaries (
    emp_no INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no) -- Foreign key referencing Employees
);
------------------------------------
CREATE TABLE Dept_emp (
    emp_no INT,
    dept_no  VARCHAR(255),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no), -- Foreign key referencing Employees
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no) -- Foreign key referencing Departments
);
------------------------------------
CREATE TABLE Dept_manager (
    dept_no  VARCHAR(255),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no), -- Foreign key referencing Departments
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no) -- Foreign key referencing Employees
);
