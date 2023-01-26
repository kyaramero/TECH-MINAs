-- Junte o primeiro nome com o último, com espaço
SELECT CONCAT(first_name, ' ', last_name) FROM sakila.actor;

-- Selecione os campos: film_id, title e description da tabela film
SELECT film_id, title, description FROM sakila.film;

-- Selecione TODOS os campos da tabela inventory
SELECT * from sakila.inventory;

-- Selecione TODOS os campos SEM usar “*” da tabela actor
SELECT ALL actor_id, first_name, last_name, last_update FROM sakila.actor;

SELECT * FROM sakila.actor WHERE first_name = 'Penelope' OR last_name = 'Monroe';

-- Selecione os dados da tabela country onde o atributo country é igual a “Brazil”
SELECT * FROM sakila.country WHERE country = 'Brazil';

-- Utilizando as informações obtidas na consulta anterior, selecione na tabela city onde o atributo country_id é igual ao id do Brasil
SELECT * FROM sakila.city WHERE country_id = 15;

--  Selecione na tabela film os filmes com o atributo rating igual a “PG-13” E length maior do que 90
SELECT * FROM sakila.film WHERE rating = 'PG-13' AND length <= 90;

-- Selecione na tabela film todos os filmes que contenham o termo “beautiful” na descrição
SELECT * FROM sakila.film WHERE description LIKE '%beautiful%';

-- Ordene os dados da tabela country pelo nome em ordem alfabética de A-Z
SELECT * FROM sakila.country ORDER BY country;

-- Ordene os dados da tabela film pelo nome do filme em ordem alfabética de Z-A
SELECT * FROM sakila.film ORDER BY title DESC;

-- Selecione na tabela film os filmes com o atributo rating igual a “PG-13” E length maior do que 90 e ordene-os por rental_rate de forma crescente
SELECT * FROM sakila.film WHERE rating = 'PG-13' AND length > 90 ORDER BY rental_rate;

-- Desafio: Selecione na tabela actor somente o primeiro e último nome e tente ordenar o
-- primeiro nome de A-Z e o último nome de Z-A
SELECT first_name, last_name FROM sakila.actor ORDER BY first_name ASC, last_name DESC;
