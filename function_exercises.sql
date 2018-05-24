USE employees;

SELECT first_name, last_name FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY last_name, first_name;

SELECT CONCAT(first_name, ' ', last_name) AS 'full_name' FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%e'
ORDER BY emp_no DESC;

SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
ORDER BY emp_no DESC;

-- SELECT first_name, last_name, hire_date FROM employees WHERE hire_date LIKE '199%';

SELECT CONCAT(first_name, ' ', last_name) AS 'emp_name', DATEDIFF(CURDATE(),hire_date) AS 'days_employed', ROUND((DATEDIFF(CURDATE(),hire_date))/365) AS 'years_employed' FROM employees WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY birth_date, hire_date DESC;

SELECT first_name, last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
