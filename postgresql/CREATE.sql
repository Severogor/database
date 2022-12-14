--
-- PostgreSQL 14.5
--

DROP SCHEMA IF EXISTS CATALOGUE CASCADE;
CREATE SCHEMA catalogue;
SET SCHEMA 'catalogue';


CREATE DOMAIN POSINT AS INTEGER CHECK (VALUE >= 0);
CREATE DOMAIN PRICE AS NUMERIC(15, 2) CHECK (VALUE >= 0);


CREATE TABLE categories (
	id UUID PRIMARY KEY,
	cat_id UUID REFERENCES categories(id) ON UPDATE CASCADE ON DELETE CASCADE,
	name VARCHAR(64) NOT NULL,
	CHECK (id != cat_id),
	UNIQUE (cat_id, name)
);

CREATE INDEX ON categories(name);


CREATE TABLE items (
	id UUID PRIMARY KEY,
	cat_id UUID REFERENCES categories(id) ON UPDATE CASCADE ON DELETE CASCADE,
	name VARCHAR(64) NOT NULL,
	stock POSINT NOT NULL,
	price PRICE NOT NULL --MONEY NOT NULL
);

CREATE INDEX ON items(cat_id);
CREATE INDEX ON items(name);
CREATE INDEX ON items(stock);
CREATE INDEX ON items(price);


CREATE TABLE clients (
	id UUID PRIMARY KEY,
	name VARCHAR(128) NOT NULL,
	address VARCHAR(128) NOT NULL,
	UNIQUE(name)
);


CREATE TABLE orders (
	id UUID PRIMARY KEY,
	client_id UUID NOT NULL REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE,
	order_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX ON orders (client_id);


CREATE TABLE order_items (
	id UUID PRIMARY KEY,
	order_id UUID NOT NULL REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE,
	item_id UUID REFERENCES items(id) ON UPDATE CASCADE ON DELETE SET NULL,
	name VARCHAR(64) NOT NULL,
	count POSINT NOT NULL DEFAULT 1,
	price PRICE NOT NULL,
	sum PRICE NOT NULL
);

CREATE INDEX ON order_items (order_id, item_id);
CREATE INDEX ON order_items (name);
CREATE INDEX ON order_items (price);
CREATE INDEX ON order_items (sum);
