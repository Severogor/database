-- Clients' orders' contents
SELECT c.name AS client, i.order_id, o.order_date, i.name AS product_name, i.count, i.price, i.sum FROM orders o 
	RIGHT JOIN clients c ON o.client_id = c.id
	LEFT JOIN order_items i ON i.order_id = o.id
ORDER BY c.name, i.order_id;


-- (#2.1) - Clients' orders count and total sum paid by each client
SELECT c.name AS client, COUNT(DISTINCT o.id) AS orders, COALESCE(SUM(i.sum), 0.00) AS sum FROM clients c
    LEFT JOIN orders o ON o.client_id = c.id
    LEFT JOIN order_items i ON i.order_id = o.id
GROUP BY c.id
ORDER BY c.name;


-- (#2.2) - Categories with direct subcategory counts
SELECT a.id, a.name, COUNT(b.id) FROM categories a 
	LEFT JOIN categories b ON a.id = b.cat_id
GROUP BY a.id
ORDER BY count DESC;
