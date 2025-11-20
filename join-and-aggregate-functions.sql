1.  Определить средний возраст пользователей для каждого города. 

Таблицы:

users (id, name, age, city_id)
cities (id, name)

select avg(age) as ‘средний возраст пользователя’ , cities.name as ‘город’ from users us
join cities cit
on us.city_id = cit.id
group by cities.name;

2. Вычислить общее количество продаж и общую сумму продаж для каждой категории товаров.

sales (id, productid, quantity, totalprice)
products (id, name, category_id)
categories (id, name)

select c.name, sum(quantity) as ‘общее количество продаж’, sum(totalprice) as ‘общую сумму продаж’
from sales  s
join products p on s.productid = p.id
join categories c on p.category_id = c.id
group by c.name

3. Найдите клиентов чьё имя является фамилией другого клиента. 
 Выведите таблицу с полями customer_id, first_name, last_name для первого клиента и такие же поля customer_id, first_name, last_name для второго. 
 Отсортируйте по customer_id первого клиента.

select A.customer_id AS customer_id, A.first_name AS first_name, A.last_name AS last_name,
 B.customer_id AS customer_id, B.first_name AS first_name, B.last_name AS last_name
from customer A
join customer B
on A.first_name = B.last_name
where A.first_name = B.last_name
order by A.customer_id;

4. Найдите фильмы из базы данных Sakila, для которых нет записей 
 об учавствоваших в них актёрах используя соединение таблиц JOIN.
Выведите результирующую с полями title, release_year отсортированных по названию фильма.
  
select title, release_year from film
left join film_actor
on film.film_id = film_actor.film_id
where film_actor.film_id is null
order by title;

5. Напишите SQL запрос, который выводит названия всех фильмов и их категорий из базы данных Sakila.

select title, category.name from film
join film_category
on film.film_id = film_category.film_id
join category
on film_category.category_id = category.category_id;

6. Напишите SQL запрос для получения списка языков из таблицы language, на которых нет доступных фильмов.
Представьте результат в таблице с одним столбцом - language, отсортированным по алфавиту.

 select name as language from language
 left join film
 on  language.language_id = film.language_id
 where film.language_id is null
 order by language;

7. Напишите SQL запрос, чтобы получить список фильмов, отсутствующих в прокате (таблица inventory).
Отобразите названия этих фильмов в столбце с названиемfilm_title в алфавитном порядке.

select film.title as film_title from film
left join inventory
on film.film_id = inventory.film_id
where inventory.film_id is null
order by film.title;

8. Найдите среднюю стоимость проката фильма для каждой категории.
Результат выведите в две колонки category и avg_rental_rate отсортировав по убыванию цены.

select name as category, avg(f.rental_rate ) as 'avg_rental_rate' from category c
join  film_category fi
on  c.category_id = fi.category_id
join film f
on fi.film_id = f.film_id
group by name
order by avg(f.rental_rate ) desc ;  

9. Найдите минимальную и максимальную и среднюю продолжительность фильма для каждой категории.
Отобразите результат в виде таблицы с колонками: category - название категории фильмов, min_length, max_length и avg_length 
 отсортированной по категории в алфавитном порядке

select name as category, min(f.length ) as min_length, max(f.length) as max_length, avg(f.length) as avg_length
from category c
join film_category fi
on c.category_id = fi.category_id
join film f
on  fi.film_id = f.film_id 
group by name
order by name;

10. Найдите категории со средней продолжительностью фильма более двух часов.
Отобразите результат в виде таблицы с колонками: category - название категории фильмов и avg_length 
 отсортированной по убыванию средней длины фильма

select name as category, avg(length) as avg_length from category 
join film_category using( category_id )
join film using(film_id)
group by name
having avg(length) > 120
order by 2 desc;

11. Напишите SQL запрос, чтобы найти трех крупнейших клиентов с наибольшим общим объемом платежей в базе данных Sakila.
Отобразите в таблице результатов имя, фамилию и общую сумму платежей клиентов в first_name, last_name и total_pay соответственно.
 Отсортируйте результаты по total_pay в порядке убывания.
  
select first_name, last_name, sum(p.amount) as total_pay from customer
join payment p using( customer_id )
group by customer_id
order by total_pay desc
limit 3;


