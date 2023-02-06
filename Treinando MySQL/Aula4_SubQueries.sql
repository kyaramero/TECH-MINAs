-- LIMIT 
SELECT * FROM sakila.rental LIMIT 30,5;

-- SUB QUERIES
WITH alugueis_na_loja AS (
	SELECT r.rental_id AS ids
	FROM sakila.rental r 
		JOIN sakila.inventory i ON r.inventory_id = i.inventory_id
        JOIN sakila.store s ON i.store_id = s.store_id
		WHERE s.store_id = 1
	)
	DELETE FROM sakila.rental WHERE rental_id IN (SELECT ids FROM alugueis_na_loja);
    
    ROLLBACK;
    
/* EXERCICIO: CONSULTE QUANTOS FILMES DE CADA CATEGORIA UM ATOR PARTICIPOU */
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;

WITH films_by_actor AS (

SELECT CONCAT(a.first_name, ' ', a.last_name) AS name , f.film_id FROM sakila.film_actor fa 
	JOIN sakila.film f ON fa.film_id = f.film_id
    JOIN sakila.actor a ON fa.actor_id = a.actor_id
    ), 
    
films_by_category AS (    
SELECT f.film_id, c.name FROM sakila.film_category fc 
	JOIN sakila.film f ON f.film_id = fc.film_id
    JOIN sakila.category c ON fc.category_id = c.category_id 
    )
    
/*  SELECT rfa.name AS actor_name , rfc.name AS category_name, COUNT(rfc.film_id) AS films_by_category FROM films_by_actor rfa 
    JOIN films_by_category rfc ON rfa.film_id = rfc.film_id
    GROUP BY rfa.name, rfc.name ORDER BY rfa.name;
*/  
  
-- Retorne a lista de atores que já atuaram em mais de 3 dramas.
	SELECT rfa.name AS actor_name , rfc.name AS category_name, COUNT(rfc.film_id) AS total FROM films_by_actor rfa 
    JOIN films_by_category rfc ON rfa.film_id = rfc.film_id WHERE rfc.name='Drama'
    GROUP BY rfa.name, rfc.name HAVING total > 2 ORDER BY total;
    
