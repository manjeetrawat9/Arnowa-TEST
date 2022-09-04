with df as(                                                                                #5
(select date_, open_ ,Company from stocks_netflix) union all
(select date_, open_,company from stocks_microsoft) union all
(select date_, open_,company from stocks_apple) union all
(select date_, open_,company from stocks_tesla) union all
(select date_, open_,company from stocks_amazon)union all
(select date_, open_,company from stocks_google))
select date_ , max(open_),company from df group by 1



select * from stocks_amazon
select date_, company ,                                                   #4
(close_-open_ ) as "daily returns",
 round(((close_-open_ )/close_)*100,2) as percentage 
from stocks_amazon

select app.date_ , 
round((ama.open_ - app.open_),3) as diff                                #3
from stocks_amazon as ama join 
stocks_apple as app 
on ama.date_= app.date_

select extract(month from cast(date_ as date)),                                  #1
extract(year from cast(date_ as date)),
max(open_) as "heighest opening",
min(open_) as "lowest opening"
from stocks_google
group by 1 ,2
