/- vim scripts/test_loading.q
show "Loading a q script"

a:123
b:45
c:001b
d:"strings"
e:1 2 3 4 5

/- Now from another terminal you can load it via
/-  q scripts/test_loading.q


/- A single forward slash line is a comment
/- use `show` to force output, or use `0N!`
/-  ; is to supress any output
/-  Note to use ; with 0N! or you will get two outputs 

/
We can comment out a whole block of lines
by starting with a single forward slash
and finishing with a signle backslash
\

/- we can continue an expression over more than one line, 
/-  by using white space -

table:([] a:10?`3; b:10?10; c:10?200;
					d:10?"")

/- In the other terminal, you can verify this via
/-  q) \v			// show the variables
/-  q) table	// show the tables

/- without the whitespace you will get error, try uncomment below
/-  two lines
/tab2:([] a:10?`3; b:10?10; c:10?2.0;
/d:10?`a`b`c`d)


/- the same applies to functions
f:{[a;b;c]
   n:a*b;
   c+n}

/- In the other terminal you can verify this via
/-  q) \f				// show the function
/-  q) f				// to inspect the function
/-	q) f[1;2;3] // to use the function


show f[1;2;3]
0N!f[2;3;4]*5;


