Use this together with scripts/using_args.q

The input can be brought into q session by using `.z.x`
Applying `.Q.opt` to parse the output into a dictionary
Arguments prefixed with `-` are parsed as keys

```
❯ # Pass on args and kwards in q scripts
❯ q -key1 value1 value2 -key2 value3 value4 100
q) .z.x
"-key1"
"value1"
"value2"
"-key2"
"value3"
"value4"
"100"
q)
q) .Q.opt[.z.x]
key1| ("value1";"value2")
key2| ("value3";"value4";"100")
q)
```

Use `.z.f` to return the script name
```
❯ q scripts/using_args.q -print time
q) print| "time"
14:57:37.876    
q) .z.f
`scripts/using_args.q
q)
q)

```

Reference: the runner script
```
❯ cat using_args.q 
/- After learning the scripts/test_loading.q
/-  this is to learning how to put users input into the script

/
learning how to use
.Q.opt
.z.x
.z.f
\

options:.Q.opt[.z.x]
show options


if["date"~options[`print][0]; variable: .z.d]
if["time"~options[`print][0]; variable: .z.t]
variable
```
