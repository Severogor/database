INSERT INTO categories (id, cat_id, name) VALUES ('d771e426-b5b0-4e01-b3da-7424bea2655f', NULL, 'Бытовая техника');
INSERT INTO categories (id, cat_id, name) VALUES 	('9f719a9c-7d55-4eb5-ad17-871a082385be', 'd771e426-b5b0-4e01-b3da-7424bea2655f', 'Плиты');
INSERT INTO categories (id, cat_id, name) VALUES 		('3d3ccb64-ade1-4a7c-b7b8-8518014eca4c', '9f719a9c-7d55-4eb5-ad17-871a082385be', 'Газовые плиты');
INSERT INTO categories (id, cat_id, name) VALUES 		('aa9cf243-f424-4231-a06a-e4c5f4302180', '9f719a9c-7d55-4eb5-ad17-871a082385be', 'Электрические плиты');
INSERT INTO categories (id, cat_id, name) VALUES 			('02372878-f33f-4080-889f-cec35aeb6780', 'aa9cf243-f424-4231-a06a-e4c5f4302180', 'Индукционные плиты');
INSERT INTO categories (id, cat_id, name) VALUES 	('28150e4a-0078-49b9-a69c-9f00da72ab00', 'd771e426-b5b0-4e01-b3da-7424bea2655f', 'Холодильники');
INSERT INTO categories (id, cat_id, name) VALUES ('e135c588-3915-48a9-a06c-3a29679a71f2', NULL, 'Садовая техника');

--INSERT INTO categories (id, cat_id, name) VALUES ('e135c588-3915-48a9-a06c-3a29679a71f3', NULL, 'Садовая техника');
-- fix: CREATE TRIGGER ... BEFORE INSERT OR UPDATE ON categories WHEN (NEW.cat_id IS NULL) EXECUTE FUNCTION ...


INSERT INTO items (id, cat_id, name, stock, price) VALUES ('b7cb059e-3ca2-4319-a04c-d1593d547ebf', '3d3ccb64-ade1-4a7c-b7b8-8518014eca4c', 'Газовая плита GEFEST ПГ 1200-С7', 3, 15000);
INSERT INTO items (id, cat_id, name, stock, price) VALUES ('ce5bed22-746c-4133-bafe-debe286e19b9', '3d3ccb64-ade1-4a7c-b7b8-8518014eca4c', 'Газовая плита Bosch HGG120E21R', 2, 30000);
INSERT INTO items (id, cat_id, name, stock, price) VALUES ('3cf872ec-4b78-4e7b-b06e-90e7bc60d615', '02372878-f33f-4080-889f-cec35aeb6780', 'Индукционная варочная поверхность Zigmund & Shtain CIS 029.45 BX', 3, 50000);


INSERT INTO clients (id, name, address) VALUES ('414da235-7043-48f1-817b-a6eb2510ed5b', 'ООО "Москва"', 'г. Москва');
INSERT INTO clients (id, name, address) VALUES ('0c02c19d-3165-432f-8d26-d370c9f236cc', 'ООО "Питер"', 'г. Санкт-Петербург');
INSERT INTO clients (id, name, address) VALUES ('a2166680-39cc-4cca-868c-6d93de699433', 'ПАО "Новгород"', 'г. Великий Новгород');


INSERT INTO orders (id, client_id) VALUES ('9f5aef7d-0947-461f-a037-07c32cbf26d0', '414da235-7043-48f1-817b-a6eb2510ed5b');
INSERT INTO orders (id, client_id) VALUES ('bdcc29b9-8c5f-4472-a01a-60f04bb857a1', '0c02c19d-3165-432f-8d26-d370c9f236cc');
INSERT INTO orders (id, client_id) VALUES ('dd1e9ee4-2cd2-44de-8105-7fbf9a656c62', '0c02c19d-3165-432f-8d26-d370c9f236cc');


-- Москва
INSERT INTO order_items (id, order_id, item_id, name, price, count, sum) SELECT '6cf97054-72c8-495b-b6e3-49f803054c67' AS id, '9f5aef7d-0947-461f-a037-07c32cbf26d0' AS order_id, id AS item_id, name, price, 2 AS count, price * 2 AS sum FROM items WHERE id = 'b7cb059e-3ca2-4319-a04c-d1593d547ebf';
INSERT INTO order_items (id, order_id, item_id, name, price, count, sum) SELECT '60cd57b7-1dcb-4855-867a-755bc15614b1' AS id, '9f5aef7d-0947-461f-a037-07c32cbf26d0' AS order_id, id AS item_id, name, price, 1 AS count, price * 1 AS sum FROM items WHERE id = 'ce5bed22-746c-4133-bafe-debe286e19b9';

-- Питер
INSERT INTO order_items (id, order_id, item_id, name, price, count, sum) SELECT '78011667-98c6-4a64-8ba1-a31c075fd528' AS id, 'bdcc29b9-8c5f-4472-a01a-60f04bb857a1' AS order_id, id AS item_id, name, price, 1 AS count, price * 1 AS sum FROM items WHERE id = '3cf872ec-4b78-4e7b-b06e-90e7bc60d615';
INSERT INTO order_items (id, order_id, item_id, name, price, count, sum) SELECT '538359ae-5283-4aa1-864b-a0acc0b64aec' AS id, 'bdcc29b9-8c5f-4472-a01a-60f04bb857a1' AS order_id, id AS item_id, name, price, 1 AS count, price * 1 AS sum FROM items WHERE id = 'ce5bed22-746c-4133-bafe-debe286e19b9';
INSERT INTO order_items (id, order_id, item_id, name, price, count, sum) SELECT 'a143bb12-e8ea-47c9-b015-a3905cb38e99' AS id, 'dd1e9ee4-2cd2-44de-8105-7fbf9a656c62' AS order_id, id AS item_id, name, price, 2 AS count, price * 2 AS sum FROM items WHERE id = '3cf872ec-4b78-4e7b-b06e-90e7bc60d615';
