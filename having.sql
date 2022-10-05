PostgreSQL: HAVING Clause
This PostgreSQL tutorial explains how to use the PostgreSQL HAVING clause with syntax and examples.

Description
The PostgreSQL HAVING clause is used in combination with the GROUP BY clause to restrict the groups of returned rows to only those whose the condition is TRUE.

Syntax
The syntax for the HAVING clause in PostgreSQL is:

SELECT expression1, expression2, ... expression_n, 
       aggregate_function (expression)
FROM tables
[WHERE conditions]
GROUP BY expression1, expression2, ... expression_n
HAVING condition;
Parameters or Arguments
aggregate_function
It can be an aggregate function such as sum, count, min, max, or avg functions.
expression1, expression2, ... expression_n
The expressions that are not encapsulated within an aggregate function and must be included in the GROUP BY clause.
WHERE conditions
Optional. These are the conditions for the records to be selected.
HAVING condition
This is a further condition applied only to the aggregated results to restrict the groups of returned rows. Only those groups whose condition evaluates to TRUE will be included in the result set.
Example - Using sum function
Let's look at a PostgreSQL HAVING clause example that uses the sum function.

You could also use the sum function to return the department and the total salaries (for that department). The PostgreSQL HAVING clause will filter the results so that only departments with total salaries greater than $50,000 will be returned.

SELECT department, sum(salary) AS "Salaries for department"
FROM employees
GROUP BY department
HAVING sum(salary) > 50000;
Example - Using count function
Let's look at how we could use the HAVING clause with the count function.

You could use the count function to return the department and the number of employees (for that department) that have a status of 'Active'. The PostgreSQL HAVING clause will filter the results so that only departments with less than or equal to 35 employees will be returned.

SELECT department, count(*) AS "Number of employees"
FROM employees
WHERE status = 'Active'
GROUP BY department
HAVING count(*) <= 35;
Example - Using min function
Let's next look at how we could use the HAVING clause with the min function.

You could also use the min function to return the name of each department and the minimum salary in the department. The PostgreSQL HAVING clause will return only those departments where the minimum salary is less than $29,000.

SELECT department, min(salary) AS "Lowest salary"
FROM employees
GROUP BY department
HAVING min(salary) < 29000;
Example - Using max function
Finally, let's look at how we could use the HAVING clause with the max function.
For example, you could also use the max function to return the name of each department and the maximum salary in the department. The PostgreSQL HAVING clause will return only those departments whose maximum salary is greater than or equal to $31,950.

SELECT department, max(salary) AS "Highest salary"
FROM employees
GROUP BY department
HAVING max(salary) >= 31950;
