CREATE TABLE category (
	id int AUTO_INCREMENT,
	name VARCHAR(50),
	description VARCHAR(225),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	
	CONSTRAINT pk_category_id PRIMARY KEY (id)

);

INSERT INTO category (name, description, image_url, is_active) VALUES ('Laptop', 'This is description for laptop!', 'CAT_1.png', 1);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Television', 'This is description for television!', 'CAT_2.png', 1);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Mobile', 'This is description for mobile category!', 'CAT_3.png', 1);

CREATE TABLE user_detail (
	id int AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(50),
	email VARCHAR(100),
	contact_number VARCHAR(15),
	CONSTRAINT pk_user_id PRIMARY KEY (id)
);

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Indra', 'Darmawan', 'ADMIN', true, 'admin', 'indradermawan100@gmail.com', '081287541209');

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Deni', 'Krisna', 'SUPPLIER', true, '12345', 'deni@gmail.com', '081288889999');

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Putri', 'Wulandari', 'SUPPLIER', true, '12345', 'putri@gmail.com', '081299998888');

CREATE TABLE product (
	id int AUTO_INCREMENT,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail (id)
);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'iPhone 5s', 'apple', 'This is one of the best phone available in the market right now!', 18000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Samsung s7', 'samsung', 'A smart phone by samsung!', 32000, 2, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Google Pixel', 'google', 'This is one of the best android smart phone available in the market right now!', 57000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Macbook Pro', 'apple', 'This is one of the best laptops available in the market right now!', 54000, 3, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Dell Latitude E6510', 'dell', 'This is one of the best laptop series from dell that can be used!', 48000, 5, true, 1, 3, 0, 0 );

CREATE TABLE address (
	id int AUTO_INCREMENT,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	billing BOOLEAN,
	shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id int AUTO_INCREMENT,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

CREATE TABLE cart_line (
	id int AUTO_INCREMENT,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_cart_id FOREIGN KEY (cart_id ) REFERENCES cart (id),
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- cara mengusulkan table buat foreign key
-- ALTER TABLE `user_detail` ADD INDEX `idx_cart` ( `cart_id` ) ;
-- ALTER TABLE `user_detail` ADD FOREIGN KEY ( `cart_id` ) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
