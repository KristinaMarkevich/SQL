1. Напишите запрос, который возвращает адреса и почтовые индексы всех адресов, расположенных в London.
Не используйте JOIN для этой задачи.

select address,  postal_code from address
where  city_id =(select city_id from city where city = 'London' and  country_id = 102);

2. В случае утери, кражи, порчи или невозврата арендованного диска с клиента взимается стоимость замены (replacement_cost).
Найдите в базе данных фильмы с самой высокой стоимостью замены используя условие с под-запросом. Напишите запрос,
который возвращает поля film_id, title и replacement_cost в возрастающем порядке поля film_id.
  
select film_id, title , replacement_cost from  film 
where replacement_cost = (select max(replacement_cost) from film)
order by film_id;

3. Напишите SQL запрос, чтобы найти фильмы, стоимость проката которых выше средней стоимости всех фильмов. 
Полученная таблица должна включать следующие столбцы:
film_id - идентификатор фильма, title - название фильма и rental_rate - стоимость проката фильма.
Отсортируйте результат по убыванию арендной ставки.

select film_id, title,  rental_rate  from film
where rental_rate > (select avg(rental_rate) from film  )
order by rental_rate desc;

4. Найдите фильмы из базы данных Sakila, в которых нет записей об актерах.
  Решите задачу без использования JOIN-ов (используя условие NOT EXISTS).
Выведите результат с полями title, release_year, отсортированными по названию фильма.

select title, release_year from film
WHERE NOT EXISTS (select * from  film_actor 
where film_actor.film_id = film.film_id)
order by title;
