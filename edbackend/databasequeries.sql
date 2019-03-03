create table category(
id int  not null auto_increment,
name varchar(50),
description varchar(255),
imageUrl varchar(50),
is_active boolean,

constraint pk_category_id PRIMARY KEY (id)
);



create table user_detail(
id int  not null auto_increment,
first_name varchar(50),
last_name varchar(50),
role varchar(50),
enabled boolean,
password varchar(50),
email varchar(100),
contact_number varchar(15),

constraint pk_user_id PRIMARY KEY (id)
);


create table address(
id int  not null auto_increment,
address_line_1 varchar(255),
address_line_2 varchar(255),
city varchar(50),
state varchar(50),
country varchar(50),
postal_code varchar(50),
shipping boolean,
billing boolean,

constraint pk_address_id PRIMARY KEY (id)

);
user_id int,
constraint fk_address_user_id foreign key(user_id) references user_detail(id)

create table cart(
id int  not null auto_increment,

grand_total decimal(10,2),
cart_lines int,

constraint pk_cart_id PRIMARY KEY(id)

);
user_id int,
constraint fk_cart_user_id foreign key(user_id) references user_detail(id)

insert into user_detail(
first_name,last_name,role,enabled,password,email,contact_number) VALUES(
'Salman','Khan','ADMIN',true,'admin123','salmankhan@gmail.com','8989898989'
);

insert into user_detail(
first_name,last_name,role,enabled,password,email,contact_number) VALUES(
'Rohit','Khanna','Supplier',true,'rohit123','rohit@gmail.com','8989001010'
);



insert into user_detail(
first_name,last_name,role,enabled,password,email,contact_number) VALUES(
'Rehana','Sheikh','user',true,'reha12','rehanactie@gmail.com','8980123456'
);

insert into user_detail(
first_name,last_name,role,enabled,password,email,contact_number) VALUES(
'Shamila','Sayyed','Supplier',true,'sham67','shammo@gmail.com','7899123456'
);

create table product(
id int  not null auto_increment,
code varchar(20),
name varchar(50),
brand varchar(50),
description varchar(255),
unit_price decimal(10,2),
quantity int,
purchases int default 0,
views int default 0,
is_active boolean,
category_id int,
supplier_id int,

constraint pk_product_id primary key (id),
constraint fk_product_category_id foreign key(category_id) references category (id),
constraint fk_product_supplier_id foreign key(supplier_id) references user_detail (id)

);


insert into product(
code,name,brand,description,unit_price,quantity,is_active,category_id,supplier_id) VALUES(
'PRDABC123DEFX','Knife Set','PohgenPaul','This is a stainless steel knife set for home makers as well as chefs',
1000,5,true,8,2);

insert into product(
code,name,brand,description,unit_price,quantity,is_active,category_id,supplier_id) VALUES(
'PRDDEF123DEFX','Bonsai Plant Pots','Wingreens','This is a Bonsai plant to enhance your gardens',
1750,10,true,9,3);

insert into product(
code,name,brand,description,unit_price,quantity,is_active,category_id,supplier_id) VALUES(
'PRDPQR123DEFX','Water Bottles','Tupperware','This is a high grade plasic bottle that lasts long for everyday need',
700,15,true,10,2);


insert into product(
code,name,brand,description,unit_price,quantity,is_active,category_id,supplier_id) VALUES(
'PRDMNO123DEFX','Soap Dispenser','Pepper','This is a soap dispenser for easy hand washing',
2000,12,true,11,3);



ALTER TABLE user_detail 
DROP FOREIGN KEY fk_cart_user_id;

create table cart_line(
id int  not null auto_increment,,
cart_id int,
total decimal(10,2),
product_id int,
product_count int,
buying_price decimal(10,2),
is_available boolean,
constraint pk_cartline_id primary key (id),
constraint fk_product_id foreign key(product_id) references product (id),
constraint fk_cart_id foreign key(cart_id) references cart (id)

);



