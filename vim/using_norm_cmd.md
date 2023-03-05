Demonstrate how to use
norm!


# Input
pewpew.lazor@gmail.com
null.personality@outlook.com
your.grandpa@aol.com
angry.at.life@hotmail.com

# Output
("pewpew.lazor@gmail.com", "null.personality@outlook.com", "your.grandpa@aol.com", "angry.at.life@hotmail.com",)


The first idea is to use norm! to add " at the beginning then
add " at the end

```
Esc 0       -- go to the beginning of the line
shift+v     -- Visual select the line
3j          -- select all three lines
:           -- go into command mode
norm!       -- any command after this is as if it was typed in vim
I"          -- press I and " to insert " at the start of the line
```

We can use Escape in norm! as well
to use that press ctrl+v then Esc, it will show sth like ``

so we can now add quotes around in one go


```
Esc 0
shift+v
3j
:
norm!
I"
          -- Escape
A"          -- Apend " at the end
```


"pewpew.lazor@gmail.com"
"null.personality@outlook.com"
"your.grandpa@aol.com"
"angry.at.life@hotmail.com"

