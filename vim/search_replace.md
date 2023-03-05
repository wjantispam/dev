# Replace/Column Replace
# The challenge here is to tidy up the list so that it keeps only the youtube http link

## Input
<li><a href="https://youtu.be/qvkppppy9K8" rel="nofollow">introducing anthony explains!</a></li>
<li><a href="https://youtu.be/sv46294LoP8" rel="nofollow">python cli tested with pytest - (beginner to intermediate)</a></li>
<li><a href="https://youtu.be/WDMr6WolKUM" rel="nofollow">python @decorators - (intermediate)</a></li>
<li><a href="https://youtu.be/kx6G3nkZTjM" rel="nofollow">my favorite python str method! (beginner - intermediate)</a></li>
<li><a href="https://youtu.be/cysuuUtbC6E" rel="nofollow">how to make a simple github PR (beginner)</a></li>
<li><a href="https://youtu.be/orp6bhe4i00" rel="nofollow">the python @property decorator (beginner - intermediate)</a></li>
<li><a href="https://youtu.be/6rAIttnm3Fs" rel="nofollow">python type(x).__name__ vs x.__class__.__name__ (intermediate)</a></li>
<li><a href="https://youtu.be/-zH0qqDtd4w" rel="nofollow">python return annotations: NoReturn vs None (intermediate)</a></li>
<li><a href="https://youtu.be/i0GOLe-F27Q" rel="nofollow">what's wrong with python's blank except:? (beginner - intermediate)</a></li>
<li><a href="https://youtu.be/VABA2rX1I_M" rel="nofollow">how I use selenium + html/css to make thumbnails (intermediate)</a></li>
<li><a href="https://youtu.be/gGqRBHHIQGE" rel="nofollow">python: raising Error without parens (intermediate)</a></li>

# Expected output
https://youtu.be/qvkppppy9K8
https://youtu.be/sv46294LoP8
https://youtu.be/WDMr6WolKUM
https://youtu.be/kx6G3nkZTjM
https://youtu.be/cysuuUtbC6E
https://youtu.be/orp6bhe4i00
https://youtu.be/6rAIttnm3Fs
https://youtu.be/-zH0qqDtd4w
https://youtu.be/i0GOLe-F27Q
https://youtu.be/VABA2rX1I_M
https://youtu.be/gGqRBHHIQGE

# Using the column selector method
# Remove the first part
 Esc 0 -- go to the beeinning of the line
 ctrl+v -- go to the Visul Mode
 10j -- select all lines
 f" -- select up to the frist ", i.e. now selected the '<li><a href="' part
 x -- delete the selected lines


## Remove the second part
 Esc 0 -- go to the line and move the cursor to the beginning of the line
 f" -- find the first "
 ctrl+v -- Visual selection mode
 10j -- move cursor down 10 rows
 $ -- move to the end (now you should selected all the things to delete
 d -- this to delete deleted everything to the end, x works too


# Using regular expression
 Note vim uses different non-greedy matching 
 try with the following

```
Input

--A--Z--A--Z--

Output
A--Z

You will notice A.*Z is too greedy
--A--Z--A--Z--
  ^^^^^^^^^^
     A.*Z
```

you'd have to use A.*?Z (the ? makes the * "reluctant", or lazy).
ref: https://stackoverflow.com/questions/2824302/how-to-make-regular-expression-into-non-greedy

In order to test this in Bash, we can use grep to ouput it (-o) and with (-P) Perl mode so it 
 understands the non-greedy method,
 I like the mnemonic -shoP


```bash
jiangwei@penguin:~/main/dev/vim                                                                                                                          
$ echo "--A--Z--A--Z--"  | grep -shoP 'A.*?Z'  # P is important here to enable Perl mode
A--Z                                                                                                                                                     
A--Z   
```

VIM uses different non-greedy syntax, and that's 
Instead of .* use .\{-}.
:help non-greedy

Now we can 

 Esc 0 -- reset and go to the beginning of the line
 shift+v -- select the line
 10j -- select the whole block
 : -- goes to the command mode (the area is already selected)
 s/<.\{-}"// -- replace it with empty, instead of * use \{-}

the end is easy with the similar s/sth/sth/ method

