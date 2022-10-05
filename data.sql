PostgreSQL CREATE TABLE syntax
A relational database consists of multiple related tables. A table consists of rows and columns. Tables allow you to store structured data like customers, products, employees, etc.

To create a new table, you use the CREATE TABLE statement. The following illustrates the basic syntax of the CREATE TABLE statement:

CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);
Code language: SQL (Structured Query Language) (sql)
In this syntax:

First, specify the name of the table after the CREATE TABLE keywords.
Second, creating a table that already exists will result in a error. The IF NOT EXISTS option allows you to create the new table only if it does not exist. When you use the IF NOT EXISTS option and the table already exists, PostgreSQL issues a notice instead of the error and skips creating the new table.
Third, specify a comma-separated list of table columns. Each column consists of the column name, the kind of data that column stores, the length of data, and the column constraint. The column constraints specify rules that data stored in the column must follow. For example, the not-null constraint enforces the values in the column cannot be NULL. The column constraints include not null, unique, primary key, check, foreign key constraints.
Finally, specify the table constraints including primary key, foreign key, and check constraints.
Note that some table constraints can be defined as column constraints like primary key, foreign key, check, unique constraints.

Constraints
PostgreSQL includes the following column constraints:

NOT NULL – ensures that values in a column cannot be NULL.
UNIQUE – ensures the values in a column unique across the rows within the same table.
PRIMARY KEY – a primary key column uniquely identify rows in a table. A table can have one and only one primary key. The primary key constraint allows you to define the primary key of a table.
CHECK – a CHECK constraint ensures the data must satisfy a boolean expression.
FOREIGN KEY – ensures values in a column or a group of columns from a table exists in a column or group of columns in another table. Unlike the primary key, a table can have many foreign keys.
Table constraints are similar to column constraints except that they are applied to more than one column.

PostgreSQL CREATE TABLE examples
We will create a new table called accounts that has the following columns:

user_id – primary key
username – unique and not null
password – not null
email – unique and not null
created_on – not null
last_login – null
The following statement creates the accounts table:

CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);
Code language: SQL (Structured Query Language) (sql)
PostgreSQL Create Table - accounts example
The following statement creates the  roles table that consists of two columns: role_id and role_name:

CREATE TABLE roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);
Code language: SQL (Structured Query Language) (sql)
PostgreSQL Create Table - roles example
The following statement creates the account_roles table that has three columns: user_id, role_id and grant_date.

CREATE TABLE account_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id)
      REFERENCES roles (role_id),
  FOREIGN KEY (user_id)
      REFERENCES accounts (user_id)
);
Code language: SQL (Structured Query Language) (sql)
PostgreSQL Create Table - account_roles example
The primary key of the account_roles table consists of two columns: user_id and role_id, therefore, we have to define the primary key constraint as a table constraint.

PRIMARY KEY (user_id, role_id)
Code language: SQL (Structured Query Language) (sql)
Because the user_idcolumn references to the user_idcolumn in the accounts table, we need to define a foreign key constraint for the user_idcolumn:

FOREIGN KEY (user_id)
REFERENCES accounts (user_id)
Code language: SQL (Structured Query Language) (sql)
The role_idcolumn references the role_idcolumn in the roles table, we also need to define a foreign key constraint for the role_idcolumn.

FOREIGN KEY (role_id)
REFERENCES roles (role_id)
Code language: SQL (Structured Query Language) (sql)
The following shows the relationship between the accounts, roles, and account_roles tables:

PostgreSQL Create Table example
Summary
Use the CREATE TABLE statement to create a new table.
Use the IF NOT EXISTS option to create the new table only if it does not exist.
Apply the primary key, foreign key, not null, unique, and check constraints to columns of a table.
