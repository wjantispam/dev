## Execution Control
## If statement
IF Syntax
`if[cond; expr1; expr2; ... exprN]`

If condition is true then all expressions are evaluated

```
q)a:b:c:0
q)if[a>0; b:10; c:20]
q)b
0 
q)c
0 
```

the condition can be a numerical value
    zero -> false
    nonzero -> true
Now, you can do it without using a comparison operator, like the following:
```
q)/### If condition is true then all expressions are evaluated
q)if[a; b:10; c:20]          
q)b
0 
q)c
0 
q)a:5
q)if[a; b:10; c:20]
q)a
5
q)b
10
q)c
```

Note, `if` does not return a value
```
q)/- if returns null
q) r:if[2>1; 10]
q) r
q) null r
1b 
```

## If-else Statement
### Syntax
`$[cond1; expr1; [cond2; expre2; ...]; ...; falseexpr]`

```
q) /- if-else - $
q) r:$[2>1; 10; 20]
q) r
10
q) 
q) /- general form
q) /- $[cond1; expr1; [cond2; expre2; ...]; ...; falseexpr]
q) a:5
q) $[a<2; 1; a<4; 2; a<6; 3; a<8; 4; 20]
3
q) $[a>10; [b:10; c:10]; [b:98; c:99]]
99
q) b
98  
q) c
99
```

## Vector Conditional
### Syntax
`?[vector condition; true expr; false expr]`
```
q) /-vector conditional - ?
q) /- ?[vector condition; true expr; false expr]
q)
q) p:10?10
q) p
8 1 9 5 4 6 6 1 8 5
q) ?[p>5; p; -1]
8 -1 9 -1 -1 6 6 -1 8 -1
q)
q) /- Take care the return type
q) ?[p>5; p; -1f]
8 -1 9 -1 -1 6 6 -1 8 -1f
q) ?[p>5; p; 0Nd]
2000.01.09 0N 2000.01.10 0N 0N 2000.01.07 2000.01.07 0N 2000.01.09 0N
q)
```

Examples

```
q) /Q given p:2 4 1 3 5, what's the output of the following
q) p:2 4 1 3 5
q) ?[p=p; p; "hello"]
"\002\004\001\003\005"
q) /TODO: why output like that?
q)
q) ?[p>3; 1; p+1]
3 1 2 4 1
q) /- means if val is > 3 then set it to 1, otherwise increment it
q) 
q) ?[differ p; p-1; 3]
1 3 0 2 4
q) /- means if there is a delta (not the same value) then decrement it,
q) /-  otherwise set it to 3
q) ?[differ p; p-1; 10]
1 3 0 2 4
q) differ p
11111b
q) p:2 4 1 1 5
q) ?[differ p; p-1; 10]
1 3 0 10 4
q) 
q) 
```

## While and Do Loops
### Syntax
`while[cond; expr1; expr2;...; exprN]`
`do[num of inter; expr1; expr2; ...; exprN]`
```
q) /-while and do loops
q) /-while[cond; expr1; expr2;...; exprN]
q) i:0
q) while[i<10; show i; i+:1]
0
1
2
3
4
5
6
7
8
9
q) /-do loop
q) /-do[num of inter; expr1; expr2; ...; exprN]
q) i:0
q) do[10; show i; i+:1]
0
1
2
3
4
5
6
7
8
9
```

Example, `do` is useful for timing operations
```
q) a:100?100f
q) b:100?100f
q) \t a xexp b
0
q) \t do[1000; a xexp b]
4
q)/- Alternative to use do as a timmer 
q) \t:1000 a xexp b
4
```


Don't try to run this
```
q) /- What does this do?
q) while[a<10;b+:1]
q) b
q) /- Why it didn't return anything?
q) /- Try to use ctrl+c?



```
