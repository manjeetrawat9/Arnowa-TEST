
###Qestion --  5. Print the company name with the highest opening value for each day.


with df as(                                                                                #Solution no. 5 
(select date_, open_ ,Company from stocks_netflix) union all
(select date_, open_,company from stocks_microsoft) union all
(select date_, open_,company from stocks_apple) union all
(select date_, open_,company from stocks_tesla) union all
(select date_, open_,company from stocks_amazon)union all
(select date_, open_,company from stocks_google))
select date_ , max(open_),company from df group by 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------

  question --4. Find the largest daily return for Amazon. (Daily return is calculated by subtracting the opening price from the closing price)

select * from stocks_amazon
select date_, company ,                                                   #solution no. 4
(close_-open_ ) as "daily returns",
 round(((close_-open_ )/close_)*100,2) as percentage 
from stocks_amazon

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Question -- 3.  Find the difference between the opening values of Amazon and Apple.

select app.date_ , 
round((ama.open_ - app.open_),3) as diff                                #solution no. 3
from stocks_amazon as ama join 
stocks_apple as app 
on ama.date_= app.date_

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
Question 2. Find the standard deviation of Volume per year for Netflix.

with a as                                                                 #solution no.2
(select *, extract(year from cast(date_ as date)) as year_ 
from stocks_netflix)
select  year_,  
std(volume) over (partition by year_ order by year_)as std_ 
from a


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Question -- 1. Print the highest opening and the lowest closing values of each month for Google.

select extract(month from cast(date_ as date)),                                  #Solution no.1 
extract(year from cast(date_ as date)),
max(open_) as "heighest opening",
min(open_) as "lowest opening"
from stocks_google
group by 1 ,2
