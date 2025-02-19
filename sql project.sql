create database project;
use project;
select * from customer;
select * from passengers_on_flights;
select * from routes;
select * from ticket_details;
alter table routes
add constraint chk_flight_number check (flight_num  >= 1000);
alter table routes
add constraint unique (route_id);
alter table routes
add constraint chk_distance_miles check (distance_miles  > 0);
select * from passengers_on_flights where route_id between 01 and 25;
select count(customer_id) from ticket_details;
select sum(Price_per_ticket) from ticket_details;
select first_name,last_name from customer; 
select class_id,customer_id
from passengers_on_flights
group by class_id,customer_id
having class_id = "Economy Plus";
select if (sum(Price_per_ticket) >= 10000, "yes","no") as result
from ticket_details;
create user if not exists 'Aditya' identified by '1705';
grant all privileges on project to 'Aditya' ;
select sum(no_of_tickets*Price_per_ticket) from ticket_details;
explain select*from passengers_on_flights where route_id =4;
select customer_id,aircraft_id, sum(no_of_tickets*Price_per_ticket) from ticket_details
group by customer_id,aircraft_id;
create view viewBusiness as
select customer_id,class_id,brand
from ticket_details where class_id='Bussiness';

select*from viewbusiness;
create view viewBussiness as
select customer_id,class_id,brand
from ticket_details where class_id='Bussiness';
select*from viewbussiness;
Delimiter &&
create procedure all_passengers ()
begin
select*from passengers_on_flights;
end &&
delimiter ;
call all_passengers ();
Delimiter &&
create procedure all_routes ()
begin
select*from routes where distance_miles >= 2000 ;
end &&
delimiter ;
call all_routes ();
delimiter &&
create procedure flight ()
begin
select flight_num,distance_miles,
case 
	when distance_miles between 0 and 2000 then 'SDT'
	when distance_miles between 2001 and 6500 then 'IDT'
    else 'LDT'
end as category
from routes;
end &&
delimiter ;
call flight ()
delimiter ;
select * from ticket_details;
delimiter &&
create procedure complimentary_services ()
begin
select p_date,customer_id,class_id,
case
	when class_id = 'Bussiness' then 'yes'
    when class_id = 'Economy Plus' then 'yes'
    else 'no'
end as services
from ticket_details;
end &&
call complimentary_services ()
delimiter ;
select first_name,last_name from customer where last_name = 'Scott' limit 1;
select c.customer_id,c.first_name,c.last_name,c.date_of_birth,c.gender,
t.class_id,t.brand from customer c 
inner join ticket_details t on c.customer_id = t.customer_id ;
select c.customer_id,c.first_name,c.last_name,c.date_of_birth,c.gender,
t.class_id,t.brand from customer c 
inner join ticket_details t on c.customer_id = t.customer_id 
where brand = 'Emirates';






