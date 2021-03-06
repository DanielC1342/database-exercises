USE employees;

SELECT de.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS de ON dm.dept_no = de.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
GROUP BY `Department Name`, e.first_name, e.last_name;

SELECT t.title AS 'Title', COUNT(de.emp_no) AS 'Count'
FROM titles AS t
JOIN employees AS e ON t.emp_no = e.emp_no
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service' AND t.to_date = '9999-01-01'
GROUP BY Title;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN salaries AS s ON dm.emp_no = s.emp_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
GROUP BY `Department Name`, e.first_name, e.last_name, s.salary;

-- BONUS

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department', CONCAT(me.first_name, ' ', me.last_name) AS 'Manager'
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN employees AS me ON dm.emp_no = me.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY `Employee Name`,Department,Manager;

SELECT DISTINCT e.gender AS 'Gender', SUM(s.salary)/COUNT(s.emp_no) AS 'average'
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY e.gender;

SELECT DISTINCT e.gender AS 'Gender', SUM(s.salary)/COUNT(s.emp_no) AS 'average'
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
GROUP BY e.gender;

SELECT DISTINCT e.gender AS 'Gender', SUM(s.salary)/COUNT(s.emp_no) AS 'average'
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_manager AS manager ON e.emp_no = manager.emp_no
WHERE s.to_date = '9999-01-01' AND e.emp_no IN (
  SELECT manager.emp_no
  FROM dept_manager
)
GROUP BY Gender;

SELECT DISTINCT e.gender AS 'Gender', SUM(s.salary)/COUNT(s.emp_no) AS 'average'
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_manager AS manager ON e.emp_no = manager.emp_no
WHERE e.emp_no IN (
  SELECT manager.emp_no
  FROM dept_manager
)
GROUP BY Gender;