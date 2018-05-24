USE employees;

SELECT de.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS de ON dm.dept_no = de.dept_no
WHERE dm.to_date = '9999-01-01'
GROUP BY `Department Name`, e.first_name, e.last_name;