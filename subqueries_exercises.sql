USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS 'Name', hire_date
FROM employees
WHERE hire_date = (
  SELECT hire_date
  FROM employees
  WHERE emp_no = 101010
);

SELECT t.title, CONCAT(e.first_name, ' ', e.last_name) AS 'Name'
FROM titles AS t
JOIN employees AS e ON t.emp_no = e.emp_no
WHERE e.first_name = 'Aamod'
ORDER BY title;

SELECT first_name, last_name
FROM employees AS e
JOIN dept_manager AS m ON e.emp_no = m.emp_no
WHERE gender = 'F' AND to_date = '9999-01-01' AND e.emp_no IN (
  SELECT m.emp_no
  FROM dept_manager
);

-- BONUS

SELECT dept_name
FROM departments AS d
JOIN dept_manager AS m ON d.dept_no = m.dept_no
JOIN employees AS e ON m.emp_no = e.emp_no
WHERE gender = 'F' AND to_date = '9999-01-01' AND e.emp_no IN (
  SELECT m.emp_no
  FROM dept_manager
)
ORDER BY dept_name;

SELECT e.first_name, e.last_name
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE salary = (
  SELECT MAX(salary)
  FROM salaries
);