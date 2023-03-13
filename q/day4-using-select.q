#!/usr/bin/env q

sales:(
       [] fruit:10?`apple`banana`orange;
          grocer:10?`dave`mark`jane; 
          price:10?10; 
          quantity:10?10
      )

show sales

select from sales

select quantity, fruit from sales

select grocer, quantity from sales where fruit=`apple

show select grocer, quantity by fruit from sales

show select sum quantity by fruit from sales

show select quantity*price by fruit, grocer from sales

show select profit: quantity*price by fruit, grocer from sales

/- select number of rows from table
show select [3] from sales

/- select y rows from the table from x index. 
show select [2 3] from sales /- select 3 rows from index 2

/- order table
show select [>grocer] from sales /- > means desc


show select [3;<grocer] fruit, price, grocer from sales where fruit in `banana`apple


show 3 sublist select from sales

show 3 2 sublist select from sales


show `grocer`fruit xasc select from sales;

/- Now we have three ways to
/-  sort a table in ascending order by price, and then return 10 results
show select [10; <price] fruit, price from sales
show 10#select [<price] fruit, price from sales
show 10#`price xasc select fruit, price from sales


