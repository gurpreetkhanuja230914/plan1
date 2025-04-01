create index i_user_name on users using HASH(username);
select * from users;
alter table users add user_id int;
update users set user_id=2 where id=2;
update users set user_id=3 where id=3;
update users set user_id=1 where id=1;
alter table users add username varchar(20);
update users set username='gp' where id=2;
select * from users where username='gp';
drop index i_user_name;
alter table users add  start_date timestamp ;
alter table users add end_date timestamp ;
alter table users add EXCLUDE USING GIST (TSRANGE(start_date, end_date) WITH &&);
update users set end_date='2025-07-08 12:23:23' where id=2;

update users set  end_date='2026-07-08 12:23:23' where id=1;
update users set  start_date='2026-04-09 12:23:29' where id=1;
insert into users(id,profile,username,start_date,end_date) values (3,'{"age":23,"name":"js"}','gps','2026-08-23 12:23:23' ,'2027-09-08 23:2:23');
select * from students;
select * from teacher;
create view s_t as select s.name,s.age, t.name as teacher_name,t.age as teacher_age from teacher t join  students s on t.student_id =s.id;  
select * from s_t;
create procedure create_user(un varchar(255))
language plpgsql
as $$
declare
user_id integer;
begin
insert into users(username) values(un) returning id into user_id;
commit;
end;
$$;
drop procedure create_user;
call create_user('rohan');
select * from users;
create table carts(user_id int);
create or replace function create_cart() returns trigger as $attach_cart$
begin
insert into carts(user_id) values(new.user_id);
return NEW;
end;
$attach_cart$ LANGUAGE plpgsql;
create trigger attach_cart after insert on users
for each row execute procedure create_cart();
select * from users;
insert into users(id,profile,username,start_date,end_date,user_id) values (4,'{"age":23,"name":"j"}','gp','2029-08-23 12:23:23' ,'2029-09-08 23:2:23',4);
select * from carts;
CREATE TABLE sales (
sale_id SERIAL,
sale_date DATE NOT NULL,
product_id INT,
quantity INT,
amount NUMERIC,
PRIMARY KEY (sale_id, sale_date)
) PARTITION BY RANGE (sale_date);
insert into sales (sale_id,sale_date,product_id,quantity,amount) values (1,'1-1-2023',1,12,230);
CREATE TABLE sales_january PARTITION OF sales
    FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');
SELECT * FROM sales WHERE sale_date >= '2023-01-01' AND sale_date < '2023-02-01';
