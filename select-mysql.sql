1. Получение всех данных из таблицы.

mysql> select * from employees;

2. Получение уникальных значений столбца.

mysql> select distinct department_id from employees;

3. Получение первых нескольких записей из таблицы.

mysql> select * from employees limit 2;

4. Переименование столбца в результате запроса.

mysql> select first_name as Имя, salary as ЗП from employees;

5. Получение данных с условием.

mysql> select salary from employees where department_id = 1;

6. Использование оператора AND для комбинирования условий.

mysql> select * from employees where department_id = 1 and salary >= 52000;

7. Использование оператора OR для комбинирования условий.

mysql> select * from employees where department_id = 3 or salary >= 52000;

8. Поиск строк с произвольными символами перед и/или после указанных символов.

mysql> select first_name from employees where first_name like "J%";

9. Поиск строк, где символ подчеркивания (_) заменяет один/несколько символов.
   
mysql> select first_name from employees where first_name like "_____";

10. Поиск значений в заданном диапазоне.

mysql> select * from employees where salary between 50000 and 65000;

11. Поиск значений, соответствующих списку значений.

mysql> select * from employees where first_name in ("Jane", "Emily");

12. Сложное условие с операторами AND и сравнениями.

mysql> select * from employees where (salary >= 62000) and department_id in (1,2);

13. Сортировка результатов по возрастанию.

mysql> select * from employees order by first_name;

14. Сортировка результатов по убыванию.

mysql> select * from employees order by salary desc;

15. Получение минимального и максимального значения из столбца.
  
mysql> select min(salary) from employees;
mysql> select max(salary) as MAX from employees;

16. Подсчет количества записей.

mysql> select count(salary) from employees;

17. Получение среднего значения из столбца.

mysql> select avg(salary) as СРЕДНЕЕ from employees;

