
--------- DATA ANALYSIS ---------------
---------------------------------- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    E.emp_no,
    E.last_name,
    E.first_name,
    E.sex,
    S.salary
FROM 
    Employees E
JOIN 
    Salaries S ON E.emp_no = S.emp_no;
------------------------------------ List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    E.first_name,
    E.last_name,
    E.hire_date
FROM 
    Employees E
WHERE 
    EXTRACT(YEAR FROM E.hire_date) = 1986;
------------------------------------ List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    D.dept_no,
    D.dept_name,
    E.emp_no,
    E.first_name,
    E.last_name
FROM 
    Dept_manager DM
JOIN 
    Departments D ON DM.dept_no = D.dept_no
JOIN 
    Employees E ON DM.emp_no = E.emp_no;
------------------------------------ List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    DE.dept_no,
    E.emp_no,
    E.first_name,
    E.last_name,
    D.dept_name
FROM 
    Dept_emp DE
JOIN 
    Employees E ON DE.emp_no = E.emp_no
JOIN 
    Departments D ON DE.dept_no = D.dept_no;
------------------------------------ List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    E.first_name,
    E.last_name,
    E.sex
FROM 
    Employees E
WHERE 
    E.first_name = 'Hercules' 
    AND E.last_name LIKE 'B%';
------------------------------------ List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    E.emp_no,
    E.first_name,
    E.last_name
FROM 
    Dept_emp DE
JOIN 
    Employees E ON DE.emp_no = E.emp_no
JOIN 
    Departments D ON DE.dept_no = D.dept_no
WHERE 
    D.dept_name = 'Sales';
------------------------------------ List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    E.emp_no,
    E.first_name,
    E.last_name,
    D.dept_name
FROM 
    Dept_emp DE
JOIN 
    Employees E ON DE.emp_no = E.emp_no
JOIN 
    Departments D ON DE.dept_no = D.dept_no
WHERE 
    D.dept_name IN ('Sales', 'Development');
------------------------------------ List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    E.last_name,
    COUNT(E.emp_no) AS last_name_count
FROM 
    Employees E
GROUP BY 
    E.last_name
ORDER BY 
    last_name_count DESC;

