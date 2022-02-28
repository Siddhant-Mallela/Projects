select * from projectportfolio.ipl;
create table new_1
select * from ipl order by date_ desc;
create table new_2
select * from new_1 group by season;
delete from new_1 where id in (select id from new_2) ;
select count(*) from projectportfolio.new_1;
select * from new_1 group by season;
select count(*) from ipl where toss_winner= winner;
select * from ipl where toss_winner= winner;
select count(player_of_match),player_of_match from ipl group by player_of_match;
select count(*) from ipl where season=2017;

select season,count(*)
 from ipl group by season;
 
 create table wtf
 select count(city) as cnc ,city from ipl group by city;
select avg(win_by_runs) as avg_ from ipl;
select * from (select * from ipl where season=2017 order by date_ desc limit 3)sub order by date_ limit 1;

create table ipl_new 
select *, row_number() over (partition by season order by date_ desc) as match_rank from ipl;

select * from ipl_new where match_rank=5;

select * from 
(select *, row_number() over (partition by season order by date_ desc) as match_rank from projectportfolio.ipl)sub 
where match_rank<=5 order by date_ desc;