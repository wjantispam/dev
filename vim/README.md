
## Delete all lines contains a pattern
`:g/profile/d`

To delete all lines that do _not_ contain a pattern, use `g!`
`:g!/^\s*"/d`
`g!` is equivalent to `v`, so you could also do the above with:
`:v/^\s*"/d`
Example: use of `\|` ("or") to delete all lines _except_ those that contain "`error`" or "`warn`" or "`fail`"
`:v/error\|warn\|fail/d`
