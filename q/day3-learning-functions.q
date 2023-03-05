#!/usr/bin/env q

/- Functions
/- general template
f:{[arg1; arg2; arg3] t:arg1*arg2*arg3}
f[1;2;3]
f:{[arg1; arg2; arg3] t:arg1*arg2*arg3; t*2}
f[1;2;3]
f:{[arg1; arg2; arg3] t:arg1*arg2*arg3; t*2;}
f[1;2;3]
f:{[arg1; arg2; arg3] t:arg1*arg2*arg3; :t*2; t+3}
f[1;2;3]
f:{[arg1; arg2; arg3] t:arg1*arg2*arg3; :t*2; t+3;}
f[1;2;3]

/- niladic function - no arguments
f:{1+1}
f:{[] 1+2+3}
f[]
f[10]
/- monadic
f:{[arg1] arg1+10}
f[2]
f:{x+10}
f[2]
/- diadic
f:{[a; b] a*b}
f[2;4]
f:{[x; y] x*y}
f[2;4]
/- triadic
f:{x*y*z}
f[2;3;4]
f:{[x;y;z] x*y*z}
f[2;3;4]
/- multivalent - must define params
f:{x*y*z*a}
f[1;2;3;4]
f:{[x;y;z;a] x*y*z*a}
f[1;2;3;4]
/test
f:{10+x*x*x}
f[13]
/Q what does f[3] returns?
f:{x+5; :a:x*x; a+2}
/- special functions
f:+
+[1;2]
f[1;2]
1 f 2
/but this will cause type error
1 f 2
/- max args is 8
f:{[a;b;c;d;e;f;g;h;i] a*b*c*d*e*f*g*h*i}
/- could use a diction to bypass the error
d:(10?" ")!1+ til 10
d
f:{[d] (+/)d}
f[d]
/- type of a function
type f
/- type of a function is 100
get f
get [f][1]
/- get of a function shows its structure
/- what does this do?
f[1]
f
get [f][2]
get [f][3]
get [f][4]
/- calling function within another function
f:{x**x}
f:{x*x}
g:{10+f[x]}
f[2]
g[2]
/- define a function within a function inline
z:{f:{x*x}; f[x]+10}
z[2]
/- but doesn't need to be assgined/unnamed function
z:{{x*x}[x] +10}
z[2]
/-Q write a function
f:{[b;h] 0.5*b*h}
f[10;7]
/-Q2 write another function
f:{x/y}
f:{{} x/y}
f[8;2]
f:{{} x%y}
f[8;2]
f:{[] x/y}
f:{[] x%y}
f[8;2]
8%2
f:{[x;y] x%y}
f[8;2]
f[70;1.6]
g:{f:{x*x} y%f[x]}
g:{f:{x*x}; y%f[x]}
g[70;1.6]
g[1.6;70]
round(27.342)
/- TODO How do you round up a number?
g:{k:{y*0.454}; m:{x*0.0254}; k[y]%m[x]}
g[189;74]
g:{{y*0.454}%{x*0.0254}}
g[189;74]
g:{[x,y]; {y*0.454}%{x*0.0254}}
g:{[x,y]; y*0.454}%{x*0.0254}
g:{[x;y]; y*0.454}%{x*0.0254}
g:{[x;y] y*0.454}%{x*0.0254}
g:{[x;y] y*0.454}%{x*0.0254}}
g:{[x;y] (y*0.454)%(x*0.0254)}
g[189;74]
g:{[x;y] (x*0.454)%(y*0.0254)}
g[189;74]
g:{[x;y] (x*0.454)%(y*y*0.0254)}
g[189;74]
g:{f:{y*y} (x*0.454)%(f[y]*0.0254)}
g:{f:{y*y}; (x*0.454)%(f[y]*0.0254)}
g[189;74]
g:{f:{y*y}; (x*0.454)%(f[y])}
g[189;74]
g:{f:{y*y}; (x*0.454)%f[y]}
g[189;74]
g:{f:{y*y}; (x*0.454)%f[y])}
g[189;74]
g:{f:{y*y}; (x*0.454)%f[y]}
g[189;74]
g:{[x;y] f:{y*y}; (x*0.454)%f[y]}
g[189;74]
g:{[x;y] f:{y*y}; f[y]}
g[189;74]
g:{[x;y] f:{x*y}; f[y]}
g[4;7]
g:{[x;y] f:{x*y}; f[x;y]}
g[4;7]
g:{[y] f:{y*y}; f[y;y]}
g[4;7]
g:{f:{y*y}; f[y;y]}
g[4;7]
g:{f:{y*y}; f[y]}
g[4;7]
(189*0.454)%((74*0.0254)*(74*0.0254))
g:{f1:{x*0.454}; f2:{a:{y*0.0254} a*a}; f1[x]%f2[y]}
/f1=2*x
/f2=(3*y)*(3*y)
/ans=f1%f2
g:{[x;y] f1:{2*x}; f2:{(3*y)*(3*y); f1[x]%f2[y]}}
g[2,4]
g[2;4]
g:{[x;y] f1:{2*x}; f2:{(3*y)*(3*y); :f1[x]%f2[y]}}
g[2;4]
g:{[x;y] f1:{2*x}; f2:{(3*y)*(3*y)}; f1[x]%f2[y]}
g[2;4]
g:{[x;y] f1:{2*x}; f2:{(3*y)*(3*y)}; type(f1[x]); type(f2[y]}
g:{[x;y] f1:{2*x}; f2:{(3*y)*(3*y)}; type(f1[x])}
g[2]
g:{[x] f1:{2*x}; type(f1[x])}
g[2]
g:{[y] f2:{(3*y)*(3*y)}; type(f2[y])}
g[2]
g:{[y] f2:{(3f*y)*(3f*y)}; type(f2[y])}
g[2]
/- TODO??
/- projection
/- e.g. 5 params function "f" - user needs to change only one param
/- set as constants four of them to make "g"
/- "g" is now a projection of "f"
f:{x*y}
f[4;5]
g:f[;5]
g[3]
g
h:f[10;]
h[2]
h
g
/- if you now change the function f but the projection will not be changed
f:{x*10*y+3}
h
/-projection of a projection
f:{x*y*z}
h:f[10]
h
g:h[;5]
g
g[2]
g
f
h
/- use lambdas
f:{x+y}
f[3;4]
f:{[a;b] a+b}
f[3;4]
{x+y} [3;4]
/- this can be quite flexiable{x+y}
{x+y} [3;] 10
{x+y} [10] 11
{x+y} [;10] 11
/- iteration
{ssr[string x;y;z]} [;"me"; "ME"] `welcome
/- this will fail....
{ssr[string x;y;z]} [;"me";"ME"] `welcome`home`mermaid
{ssr[string x;y;z]} [;"me";"ME"] each `welcome`home`mermaid
/- we can done with dfined function of course
f:{ssr[string x;y;z]}
f[;"me";"ME"] each `welcome`home`mermaid
/Q: write a function f which accepts three parameters, length, breadth
/ and height, and calculates the volume of a pyramid 
f:{(l*b*h)%3}
f[4;4;8]
f:{[l;b;h] (l*b*h)%3}
f[4;4;8]
/Q2
f:{[l;b;h] (l*b*h)%3}
g[10;]
g
g:f[10;]
g

g[4;8]
g[9;9]
/- TODO how to do above in one expression? maybe with each
\\
