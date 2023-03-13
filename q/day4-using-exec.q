#!/usr/bin/env q

sales:(
       [] fruit:10?`apple`banana`orange;
          grocer:10?`dave`mark`jane; 
          price:10?10; 
          quantity:10?10
      )


/- exec vs select; exec returns a dictionary

show exec fruit from sales
show exec fruit!price from sales
show exec fruit!price by grocer from sales


/- update (modify table)
show update salevalue:price*quantity from sales

show update totalquantity: sums quantity from sales
show update totalquantity: sums quantity by fruit from sales

show update price:11 from sales where fruit = `banana
show sales

/- update modify tabel in place
show update price:11 from `sales where fruit = `banana

/- delete
show delete grocer, quantity from sales
/- you will need to change table name to symbol to update the table

tables[]


/- insert

cars:([] brand:`symbol$(); model:`symbol$(); purchasedate:`date$())
show cars

