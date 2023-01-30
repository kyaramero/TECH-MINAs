-- Usando funções

-- * REPLACE *
SELECT 
	REPLACE(
	description, 'Beautiful', 'Beautiful potato') 
    AS 'Título novo'
    FROM sakila.film
    WHERE description LIKE '%beautiful%';

-- * CONCAT *
SELECT CONCAT (
	'Se alugarmos TODOS os filmes, receberemos US$ ',
		SUM(rental_rate))
	FROM 
    sakila.film;

-- * SIMILAR A UM IF *
SELECT CONCAT('O filme: ', title, ' foi atualizado pela última vez dia ', EXTRACT(DAY FROM last_update), ' de ', 
	(CASE 
		WHEN EXTRACT(MONTH FROM last_update) = 1 THEN 'Janeiro'
		WHEN EXTRACT(MONTH FROM last_update) = 2 THEN 'Fevereiro'
        WHEN EXTRACT(MONTH FROM last_update) = 3 THEN 'Março'
        WHEN EXTRACT(MONTH FROM last_update) = 4 THEN 'Abril'
        WHEN EXTRACT(MONTH FROM last_update) = 5 THEN 'Maio'
        WHEN EXTRACT(MONTH FROM last_update) = 6 THEN 'Junho'
        WHEN EXTRACT(MONTH FROM last_update) = 7 THEN 'Julho'
        WHEN EXTRACT(MONTH FROM last_update) = 8 THEN 'Agosto'
        WHEN EXTRACT(MONTH FROM last_update) = 9 THEN 'Setembro'
        WHEN EXTRACT(MONTH FROM last_update) = 10 THEN 'Outubro'
        WHEN EXTRACT(MONTH FROM last_update) = 11 THEN 'Novembro'
        WHEN EXTRACT(MONTH FROM last_update) = 12 THEN 'Dezembro'
        ELSE 'Mês não existe'
	END),
    ' de ', 
    EXTRACT(YEAR FROM last_update)) AS 'Data de lançamento por extenso'
FROM sakila.film
	ORDER BY EXTRACT(MONTH FROM last_update) ASC;
        
-- GROUP BY
SELECT 
	rental_duration,
    COUNT(film_id)
FROM
    sakila.film
GROUP BY rental_duration
ORDER BY rental_duration;

-- INNER JOIN
-- O ren é um apelido para sakila.rental (escolhido por mim)
-- O inv é um apelido para sakila.inventory (escolhido por mim)
SELECT ren.rental_id, ren.rental_date, CONCAT(cust.first_name, ' ', cust.last_name), store.store_id, film.title FROM sakila.rental ren
	JOIN sakila.inventory inv ON
	ren.inventory_id = inv.inventory_id
    JOIN sakila.store store ON inv.store_id = store.store_id
    JOIN sakila.film film ON inv.film_id = film.film_id
    JOIN sakila.customer cust ON ren.customer_id = cust.customer_id;
    
    -- EXERCÍCIOS
-- Na tabela actor, agrupe os registros pelo last_name para saber quantos atores têm o
-- mesmo sobrenome
SELECT cust.customer_id, 
	cust.first_name,
    cust.last_name,
    act.actor_id,
    act.first_name,
    act.last_name 
    FROM sakila.actor act
    JOIN sakila.customer cust ON cust.last_name = act.last_name
    ORDER BY cust.last_name ASC;
    
-- Agora utilize GROUP BY e COUNT para retornar somente quantos clientes e qual sobrenome
SELECT COUNT(cust.customer_id), cust.last_name FROM sakila.customer cust, sakila.actor act WHERE cust.last_name = act.last_name GROUP BY cust.last_name;


-- LEFT JOIN
SELECT 
    cust.customer_id,
    cust.last_name,
    act.actor_id,
    act.last_name
FROM
    sakila.customer cust LEFT JOIN
    sakila.actor act ON cust.last_name = act.last_name
    ORDER BY cust.last_name ASC;
    
    -- EXERCÍCIOS 2
-- Faça um select que recupere o nome do cliente na tabela customer e o distrito na tabela address.
SELECT addr.district, 
	CONCAT(cust.first_name, ' ', cust.last_name)
    FROM sakila.customer cust JOIN sakila.address addr 
    ON cust.customer_id = addr.address_id;

--  Busca a quantidade de filmes agrupando pelo idioma do filme.
SELECT lan.name AS 'Language', 
	COUNT(fil.film_id) AS 'Number of films' 
    FROM sakila.film fil, sakila.language lan 
    WHERE fil.language_id = lan.language_id 
    GROUP BY lan.name;

-- Recupere o nome e sobrenome do cliente (customer) e a quantidade de locações (rental) que ele fez, com ordenação do maior para o menor.
SELECT
	COUNT(ren.customer_id),
    CONCAT(cust.first_name, ' ',cust.last_name)
    FROM sakila.customer cust, sakila.rental ren
    WHERE cust.customer_id = ren.customer_id
    GROUP BY cust.last_name, cust.first_name
    ORDER BY COUNT(ren.customer_id) DESC;

