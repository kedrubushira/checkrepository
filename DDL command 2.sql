SELECT * FROM groupc.amazo;
update amazon
set Cage=42,Cstate='FL'
where Cid=6;

select * from amazon
where Cstate='MD';

-- how to distincit

select distinct Cgender from amazon;

select distinct Cstate from amazon;

-- how to use oeder by(asc and des)

select * from amazon
order by Cageasc;

select Cid,Cage from amazon
order by Cid desc, Cage asc; 
select * from amazon
order by Cpayment asc,Cname desc;
-- logical operators are( And OR and NOT EUALL)
select* from amazon
where Cpayment>6000 and Cgender ='M';

select* from amazon
where Cpayment>6000 or  Cgender='M';

select* from amazon
where not Cstate ='MD';

select* from amazon
where not Cstate ='MD';

-- starttransaction 

insert into amazon(Cid,Cname,Caddress,Czipcode,Cgender,Cpayment,Cstate,Cage)
values( 8,'Ruth','2r',20345,'F',9000,'MD',32);

savepoint k ;

select * from amazon;

-- special operators(Between,Null,Exists,In,Like,Any, All)
select * from amazon  where Cage between 30 and 36;


select * from amazon  where Cage between 30 and 35;


select *from amazon where Cname between 'Belay'and'MInase';


select* from amazon
where Cpayment is null;

select* from amazon
where Cpayment is not null; 

select* from amazon
where Cname like 'H%';

select* from amazon
where Cname like '%a';

select* from amazon
where Cname like 'H%';

select* from amazon
where Cname like '%ss%';

select* from amazon
where Cname like '_e%';
-- the name start in F and end A

select* from amazon
where Cname like 'f%a';

select* from amazon
where Cstate in('MD','VA');

-- (Nested  Query)-- Exists,All,Any

-- we need two or more tables inorder to perform the next command
create table customer( 
CID int not null auto_increment,
Cname varchar(50) not null,
City varchar(50) not null,
primary key(CID)
);


create table product( 
PID int not null primary key auto_increment,
CID int ,
pInfo varchar(255) not null,
Cproduct varchar(50) not null default'Iphone',
constraint Fk_customer foreign key(CID) references customer (CID) on delete cascade on update cascade
);

describe customer;

insert into customer(Cname,city)
values('Joseph','California'),
('Mary','NewYork'),
('JOnh','Alaska');

desc product;

insert into product(PInfo,Cproduct)
values('electronic','Iphone'),
('Furniture','Charles'),
('tools','Hamer'),
('Clothes','Tisherts');

SELECT * FROM groupc.product;

alter table customer
add Cstate varchar (50);


alter table customer
drop column city;
alter table customer

-- alter table customer;
-- how to delete the foreign key 
 drop foreign key FK_customer;
 
 
 -- how to add foreign key in alter comamand
 alter table customer
 add  constraint FK_customer foreign key(CID) references customer(CID) on update cascade on delete cascade;
 
 select * from product
 where exists(select *from customer where customer.CID=product.PID);
 
 select * from product
 where not exists(select *from customer where customer.CID=product.PID);
 
 select * from customer
 where exists(select *from product where customer.CID=product.PID);
 
 select * from product
 where not exists(select *from customer where product.PID=customer.CID);
  select *from customer
  where CID=all(select PID from product where PID=3);
  
  select *from product
  where PID>=all(select PID from product where PID>=3);



 




 

