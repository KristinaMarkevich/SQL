All exercises are taken from Interactive Online 
SQL Course - https://sql-academy.org/en/trainer

  
1.Calculate the number of operating warehouses as of the current date for each city. 
Display only those cities that have more than 80 warehouses. The output data is the city, the number of warehouses.
  
select city,
count(*) warehouse_count
from Warehouses
where date_close is null
group by city
having warehouse_count > 80;

2. Display the names of customers who each purchased a "Laptop" and "Monitor" (use product.name) in March 2024?
  
select Customer.name from Customer
join Purchase using (customer_key)
join Product using (product_key)
where Product.name in ('Laptop', 'Monitor')
and Purchase.date like "2024-03%"
group by Customer.name
having count(distinct Product.name) = 2;

3. Given a database with information about developers and projects. 
The Developers table stores developer information, the Projects table stores project information, the ProjectHistory table stores the history of developers working on projects.
Display all projects (name) that were never worked on by developers.
  
select Projects.name from Projects
left join ProjectHistory on Projects.id = ProjectHistory.project_id
group by Projects.id
having count(ProjectHistory.project_id) < 1;

4. Given a database with information about purchases and registered customers.
The purchases table stores purchase information, the registered_customers table stores registered customer information.
Write a query to identify the number of orders placed by each registered customer. Display the customer ID and the total number of orders placed by each customer.

select registered_customers.customer_id,
count(purchases.customer_id) as total_orders
from registered_customers
left join purchases using (customer_id)
group by registered_customers.customer_id;

5. Given a database with information about companies and their contracts. 
The Company table stores company information, the Contract table stores contract information, the Company_contract table stores relations between companies and their contracts.
Find contract numbers (contract_number) for companies whose name (company_name) contains 'SBER'.

select contract_number
from Contract
join Company_contract using(contract_id)
join Company using (company_id)
where company_name like 'SBER%';

6. Given a library management database. The Books table stores information about literary works, 
the BookEditions table stores information about editions of these works (one work can be published many times in different years).
Find works that were published more than 5 times. Output the work title (title).

select title
from Books
join BookEditions on Books.id = BookEditions.book_id
group by title, BookEditions.book_id 
having count(*) > 5;

6. You need to write an SQL query that will show all employees who have less than three tasks in progress. The result should include: employee name, number of tasks in progress.

select emp_name,
count(*) as task_count
from Employee
join Tasks on Employee.id = Tasks.assignee_id
group by Employee.id
HAVING task_count < 3;

7. Count the population of each region. As a result, print the name of the region and its population.

select Regions.name as region_name,
sum(population) as total_population
from Regions
join Cities on Regions.id = Cities.regionid
GROUP by Regions.name;
