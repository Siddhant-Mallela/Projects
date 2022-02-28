SELECT * FROM revenue.athlete_events;
select * from athlete_events;
select * from athlete_events  order by Age desc;
create table summer
select * from athlete_events where Season='Summer';

select count(*) from summer group by Season;

create table winter
select * from athlete_events where Season='Winter';

select * from winter;
alter table winter 
add column medal_no int;
select * from winter;
select Medal , case when Medal= 'NA' then 0 else 1 end as medal_no from winter;
update winter set medal_no=0 where Medal='NA';
update winter set medal_no=1 where Medal!='NA';
select * from winter;
select Name, sum(medal_no) from winter group by Name order by sum(medal_no); 
select sum(medal_no) from winter where Name like '%Kje%';
select Team,sum(medal_no) from winter group by Team order by sum(medal_no) desc;

alter table summer add column medal_no int;
update summer set medal_no=0 where Medal="NA" ;
update summer set medal_no=1 where Medal!="NA";
select * from summer;
select Name, sum(medal_no) from summer group by Name order by sum(medal_no) desc;
select Team, sum(medal_no) from summer group by Team order by sum(medal_no) desc;

select * from summer where Team="India" and medal_no=0;
select * from winter where Team='India' and medal_no=0;