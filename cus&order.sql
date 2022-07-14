create database Restaurant;
create table customer(
C_id varchar(15) not null,
F_name varchar(15) ,
L_name varchar(15) ,
C_email varchar(20),
C_Address varchar(35),
C_phane Varchar(15),
constraint Cu_PK primary key(C_id),
);
create table Orders(
order_no int not null primary key,
order_date date not null,
order_time time not null,
comments varchar(15),
cus_id varchar(15),
constraint O_C_fk foreign key (cus_id)
references customer (C_id),

);
alter table Orders
add item_num int;

alter table Orders
add Quantity int;
 
alter table Orders
add constraint  fk_O_M foreign key (item_num )
references Menu_item (item_num);

alter table Orders
drop fk_O_M;

alter table Orders
drop column item_num  ;

alter table Menu_item
add order_id int  ;

alter table Menu_item
drop column order_id  ;

alter table Menu_item
add constraint  fk_O_M foreign key (order_id )
references Orders(order_no);


alter table Menu_item
drop    fk_O_M  ;


create table OrdersDetails(
order_on int ,
item_no int,
constraint O_D_fk foreign key (order_on)
references Orders(order_no),
constraint M_D_fk foreign key (item_no)
references  Menu_item(item_num),

);
 create table BILL(
 Bill_no int not null ,
 cus_id varchar(15),
 order_detials varchar(15) not null ,
 order_no int ,
constraint C_B_fk foreign key (cus_id)
references  customer (C_id),
constraint B_PK primary key(cus_id,Bill_no)
 );
 
alter table BILL
add constraint  fk_O_B foreign key ( order_no )
references Orders (order_no);
create table paymant(
paymant_no int not null primary key,
pymant_type varchar(15) not null,
Bill_no int not null,
Cus_id varchar(15),
constraint P_b_fk foreign key (Cus_id,Bill_no)
references BILL (cus_id,Bill_no)
);

create table Menu_item(
type_item varchar(15),
item_name varchar(15) not null UNIQUE,
item_num int primary key ,
Quntity int not null,
Description varchar(50) ,
price int not null,

);
ALTER TABLE Menu_item
DROP COLUMN Quntity;


alter table Menu_item
alter column price decimal(10,2);

alter table BILL
add price decimal(10,2);