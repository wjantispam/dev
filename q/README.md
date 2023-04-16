1. Introduction and Getting Start
2. Atoms and Lists
3. Dictionaries, Tables and Functions
4. Selects and QSQL
	1. Introduction to Selects and QSQL
	2. Using Select Statements
	3. The Where Clause
	4. The By Clause
	5. Functional Form
	6. Using an IDE
	7. Selects and QSQL Conclusion
5. Keywords, Joins, Adverbs and Attributes
6. IPC and Web Access
7. File I/O
8. Data Analysis
9. Supporting a Kdb+ System
10. Kdb+ Tick
11. Kdb+ Developer
12. Broken HDB Exercises
13. ITCH Parser
14. c.Java - An Interface Between kdb+ and Java
15. Bootcamp Bonus
16. Bootcamp Enterprise Final Quiz


# Selects and QSQL
Ref: https://code.kx.com/q/ref/exec/


```
Syntax:
select [_Lexp_] [_ps_] [by _pb_] from _texp_ [where _pw_]

where

_Lexp_ Limit expression
_ps_ Select phrase 
_pb_ By phrase 
_texp_ Table expression 
_pw_ Where phrase
```
## Introduction to Selects and QSQL
```
select [n] ...
n sublist ....
select [m n] ... # return n results from pos m
m n sublist ...
select [order] ...
select [n; order] ....
	sort order: use `<` for ascending, `>` for descending
select distinct ...
```

## Select and Exec
exec doesn't return a table
```
q)a:([] c1:1 2 3; c2: `a`b`c; c3:8 9 20)
# It returns a list
q)exec c2 from a
`a`b`c
# returns a dictionary
q)exec c1, c2 from a
c1| 1 2 3
c2| a b c
# Using # to return the first or last n results
q)2#exec c1, c2 from a
c1| 1 2 3
c2| a b c
q)1#exec c1, c2 from a
c1| 1 2 3
q)1#exec c2 from a
,`a
q)2#exec c2 from a
`a`b
q)-2#exec c2 from a
`b`c
```
## Update
```
q)update dp: price*2 from sales where trader=`Bob
trader product price quantity dp
--------------------------------
Bob    book    1     12       2
Bob    book    2     10       4
Bob    paper   2     1        4
John   book    3     90
Paul   pencil  2     73
q)update ap:avg price by trader from sales
trader product price quantity ap
--------------------------------------
Bob    book    1     12       2.75
Bob    book    2     10       2.75
Bob    paper   2     1        2.75
John   book    3     90       4.2
Paul   pencil  2     73       2.571429
Paul   paper   1     90       2.571429
```
if you want in-place update then the table name has to be a symbol

## Delete

```
delete <column> from <table>
delete from <table> where <condition>
it can also be applied to workspace
q)\v
`a`product`sales`trader
q)
q)delete sales from `.
`.
q)\v
`a`product`trader`
q) delete `. # this deletes everything fromt he workspace
```


## Insert
```
Syntax: `<table> insert <records>`
```

Common problems:
1. must refer to the table with a back-tick or resulting a type error

## Upsert



# The Where Clause

Suppose we have some trade prices and sizes for a variety of symbols and sources. If there are 50 symbols and 4 sources, with sizes evenly distributed between 1 and 100000, which of the following will be the most efficient?
```
select from trades where sym=`GOOG,src=`N,size>200
select from trades where size>200,src=`N,sym=`GOOG
select from trades where src=`N,sym=`GOOG,size>200
select from trades where sym=`GOOG,size>200,src=`N
```

For historical database
