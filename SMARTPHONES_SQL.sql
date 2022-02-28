SELECT * FROM sakila.smartp;
select * from smartp;
describe smartp;
create table _what_
select Price_of_product,replace(Price_of_product,',',''),replace(first_sitep,',',''),replace(second_sitep,',','')
from smartp;
select * from _what_;
select * from smartp;
create table _comp_
select product_name,substring_index(product_name,' ',1) as phone_c from smartp;
select * from _comp_;

select * from smartp 
inner join 
_comp_ on _comp_.product_name=smartp.product_name;

select * from _comp_;

alter table smartp add column phone_c varchar(40);
update smartp
left join _comp_ 
on _comp_.product_name=smartp.product_name
set smartp.phone_c=_comp_.phone_c;

select * from smartp;

create table processor_name
select product_name,substring_index(processor_price,' ',1) as processor_name from smartp;
describe processor_name;
select product_name,substring_index(product_name,' ',1) as phone_c from smartp;

alter table smartp add column processor_name varchar(40);
update smartp 
left join processor_name on processor_name.product_name=smartp.product_name 
set smartp.processor_name= processor_name.processor_name;

select * from smartp;

create table _damn1_
select product_name, replace(Price_of_product,',','') as product_price,
replace(first_sitep,',','') as first_price,
replace(second_sitep,',','') as second_price 
from smartp;
select * from _damn1_;

create table _damn2_
select product_name,product_price,nullif(first_price,''),nullif(second_price,'') from _damn1_;
select * from _damn2_;
describe _damn2_;

alter table smartp add column product_price numeric;
alter table smartp add column first_price numeric;
alter table smartp add column second_price numeric;
select * from smartp;

update smartp
left join _damn2_ on smartp.product_name=_damn2_.product_name
set smartp.product_price=_damn2_.product_price,
smartp.first_price=_damn2_.first_price,
smartp.second_price=_damn2_.second_price;
select * from smartp;

update smartp
set score= null where score='';
select * from smartp;
describe smartp;

select * from smartp;
select phone_c,avg(product_price) from smartp group by phone_c order by product_price desc;
select * from smartp where phone_c= 'AGM';

select * from smartp;
select processor_name,count(processor_name) from smartp group by processor_name 
order by count(processor_name) desc;

select product_name,score  from smartp where score is not null order by score desc;
select *  from smartp where score=9 order by product_price desc;
select first_site, count(first_site) from smartp where first_site!='' group by first_site;
select second_site, count(second_site) from smartp where second_site!='' group by second_site;
 select * from smartp;

#RAM,Storage,Battery,Android Version Product Name 
create table _dump3_
select product_name, substring_index(RAM,' ',1) as RAM_gb,
substring_index(display_size,' ',3) as display,
substring_index(Battery,' ',1) as battery_mAH,substring_index(storage,' ',1) as storage_gb,substring_index(android_version,' ',1) as os_sys,
substring_index(substring_index(android_version,' ',2),' ',-1) as os_version 
from smartp;

select * from _dump3_;
alter table smartp add column RAM_gb numeric;
alter table smartp add column display varchar(40);
alter table smartp add column battery_mAH numeric;
alter table smartp add column storage_gb numeric;
alter table smartp add column os_sys varchar(40);
alter table smartp add column os_version varchar(40);

update smartp 
left join _dump3_ on _dump3_.product_name=smartp.product_name
set
smartp.RAM_gb=_dump3_.RAM_gb,
smartp.display=_dump3_.display,
smartp.battery_mAH=_dump3_.battery_mAH,
smartp.storage_gb=_dump3_.storage_gb,
smartp.os_sys=_dump3_.os_sys,
smartp.os_version=_dump3_.os_version;

select * from smartp;
select product_price,RAM_gb, storage_gb,product_name from smartp where phone_c='Apple' order by product_price  ;
select product_price,RAM_gb, storage_gb,product_name from smartp order by RAM_gb desc;
select * from smartp;

select count(phone_c) as COUNT,phone_c from smartp group by phone_c order by count(phone_c) desc limit 5;
select * from smartp where phone_c!= "Apple" order by product_price desc limit 5;
select phone_c, count(phone_c) from smartp where product_price 
between 20000 and 50000 group by phone_c order by count(phone_c) desc limit 5;

select os_version,phone_c from smartp where phone_c='Apple';
select os_sys,os_version,count(os_version) from smartp group by os_version;
select * from smartp where os_version='v12';
select * from smartp where phone_c='OnePlus' and product_price between 20000 and 40000 and os_version='v11' order by product_price;