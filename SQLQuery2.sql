create table Tables(
Table_no               int         primary key,
Available_seats        varchar(15) not null,
Cus_id                  varchar(15),
foreign key(Cus_id) references customer(C_id),
);

create table Employee(
 F_name varchar(15) NOT NULL,
 M_name varchar(15) NOT NULL,
 L_name varchar(15) NOT NULL,
 ID_em varchar(20) NOT NULL primary key,
 sex  varchar(7) NOT NULL,
 email varchar(20) NOT NULL,
 salary INT NOT NULL,
 Address varchar(40) NOT NULL,
 hours time NOT NULL,
 bouns decimal(10,2) NOT NULL,
 manag_employee varchar(20),
constraint M_E_fk foreign key (manag_employee)
references  Employee(ID_em)
);

create table Waiter(
Waiter_id              varchar(20)          primary key,
Order_no                int ,
Table_no                int,
foreign key(Waiter_id )references Employee(ID_em),
foreign key(Order_no)references Orders(Order_no),
foreign key(Table_no)references Tables(Table_no),
);

alter table Employee
alter column bouns decimal(10,2) NULL;

alter table Employee
add Join_date date null,
 Birth_date date ;

alter table Tables
add order_no int;

alter table Tables
add constraint  fk_O_T foreign key (order_no)
references Orders (order_no);




create table Chef(
Chef_id               varchar(20)      primary key,
DayORnight             varchar(10) ,
foreign key(Chef_id)references Employee(ID_em),
);
create table prepare(
Chef_id varchar(20) ,
order_no int,
constraint O_C_pk primary key (Chef_id ,order_no),
constraint C_P_fk foreign key (Chef_id)
references  Chef(Chef_id),
constraint O_P_fk foreign key (order_no)
references  Orders(order_no),
);

