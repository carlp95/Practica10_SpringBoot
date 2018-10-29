insert into category(id, is_sub_category, name, mayor_category_id) values (1, false, 'PC y Portátiles', null);
insert into category(id, is_sub_category, name, mayor_category_id) values (2, false, 'Celulares', null);
insert into category(id, is_sub_category, name, mayor_category_id) values (3, false, 'Ferretería', null);
insert into category(id, is_sub_category, name, mayor_category_id) values (4, true, 'Portatil', 1);
insert into category(id, is_sub_category, name, mayor_category_id) values (5, true, 'Huawei', 2);
insert into category(id, is_sub_category, name, mayor_category_id) values (6, true, 'Construcción', 3);
insert into category(id, is_sub_category, name, mayor_category_id) values (7, true, 'Electrodomésticos', 3);
insert into category(id, is_sub_category, name, mayor_category_id) values (8, true, 'GPS & Navegación', 3);

insert into device(id,name,color,issue_Date,company,units_Available,daily_Cost,category_id,sub_Category_id,photo_path) values (6,'Tostadora','Cromaada','2018-03-30','Oster',15,80, 3, 7, '');
insert into device(id,name,color,issue_Date,company,units_Available,daily_Cost,category_id,sub_Category_id,photo_path) values (1,'ROG Strix Hero Edition','Negra','2017-11-20','Asus',10,1000, 1, 4, '');
insert into device(id,name,color,issue_Date,company,units_Available,daily_Cost,category_id,sub_Category_id,photo_path) values (2,'Huawei P8','Negro','2015-07-23','Huawei',100,50, 2, 5, '');
insert into device(id,name,color,issue_Date,company,units_Available,daily_Cost,category_id,sub_Category_id,photo_path) values (3,'Taladro Makita','Verde','2018-05-15','Makita',20,15, 3, 6, '');
insert into device(id,name,color,issue_Date,company,units_Available,daily_Cost,category_id,sub_Category_id,photo_path) values (4,'GPS','Rojo','2016-08-06','Global',5,100, 3, 8, '');
insert into device(id,name,color,issue_Date,company,units_Available,daily_Cost,category_id,sub_Category_id,photo_path) values (5,'Lavadora','Blanca','2018-02-12','Whirpool',60,200, 3, 7, '');

insert into CUSTOMER values ('402-2472509-9', 'Mi casa', '8099342324', 'Salcedo', 'John', 'Doe', '8099091234', 'default.png');

-- INSERT INTO RENT (ID, PENDING, RENT_DATE, UNTIL_DATE, CUSTOMER_ID) VALUES (0, true, '2018-10-29', '2018-10-10', '402-2472509-9');