-- Inserindo dado
INSERT INTO sakila.actor (first_name, last_name, actor_id) VALUES ('Cebolinha', 'Sousa', 201); 

-- Atualizando 
UPDATE sakila.actor SET last_name = 'Limoeiro', last_update = NOW( ) WHERE actor_id = 201;

-- Selecionando 
SELECT * FROM sakila.actor WHERE last_name = 'Limoeiro';

-- Deletando
DELETE FROM sakila.actor WHERE actor_id = 201;


-- EXERCICIO 1
-- Insira um novo ator na tabela actor passando MANUALMENTE todos os dados, incluindo actor_id e last_update
INSERT INTO sakila.actor (actor_id, last_update, first_name, last_name) VALUES (252, NOW(), 'Ewan', 'McGregor');

-- Insira um novo filme na tabela film passando os seguintes dados: title (título), description (descrição) e language_id (Id do idioma) *Para obter uma language_id consulte a tabela language
INSERT INTO sakila.film (title, description, language_id) VALUES ('Pinoquio', 'About a wooden boy', 1);

-- Desafio: Utilizando o novo actor e o novo film insira o actor_id e o film_id na tabela film_actor para relacionar o novo ator com o novo filme.
SELECT * FROM sakila.actor WHERE first_name = 'Ewan'; -- 252
SELECT * FROM sakila.film WHERE title = 'Pinoquio';
INSERT INTO sakila.film_actor (actor_id, film_id) VALUES (252, 1001);
-- 


-- Criar tabela
CREATE TABLE sakila.vegetais (id_vegetal INT NOT NULL, nome VARCHAR(255) NOT NULL, calorias DOUBLE(7,3), PRIMARY KEY (id_vegetal));

-- Alterar tabela
ALTER TABLE sakila.vegetais MODIFY nome VARCHAR(60);

-- Apagar tabela 
DROP TABLE sakila.vegetais;


-- EXERCÍCIO 2
-- A definição da nossa tabela é a seguinte: order_id SMALLINT UNSIGNED PRIMARY KEY (id do pedido) store_id TINYINT UNSIGNED NOT NULL (qual loja fez o pedido) 
-- film_id SMALLINT UNSIGNED NOT NULL (qual filme foi pedido) ordered_amount SMALLINT UNSIGNED NOT NULL (quantos filmes foram pedidos) price DECIMAL(10,3) NOT NULL (quanto custa o pedido) 
-- order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
CREATE TABLE sakila.orders (
order_id SMALLINT UNSIGNED PRIMARY KEY, 
store_id TINYINT UNSIGNED NOT NULL, 
film_id SMALLINT UNSIGNED NOT NULL, 
ordered_amount SMALLINT UNSIGNED NOT NULL, 
price DECIMAL(10,3) NOT NULL, 
order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);


ALTER TABLE sakila.orders 
ADD INDEX fk_store_id_idx (store_id ASC) VISIBLE,
ADD INDEX fk_film_id_idx (film_id ASC) VISIBLE,
ADD CONSTRAINT fk_store_id 
FOREIGN KEY (store_id) 
REFERENCES sakila.store(store_id) ON DELETE RESTRICT 
ON UPDATE CASCADE, 
ADD CONSTRAINT fk_film_id
FOREIGN KEY (film_id)
REFERENCES sakila.film (film_id)
ON DELETE RESTRICT 
ON UPDATE CASCADE; 
