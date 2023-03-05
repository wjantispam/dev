#!/usr/bin/env q


dy:(`a`b`c)!(1 2 3;`a`b`c;7 8 9)
dy

// simple table
([]a:1 2 3; b:`a`b`c; c:7 8 9)

// keyed table
([a:1 2 3]b:`a`b`c; c:7 8 9)

// empty table
([] a:`int$(); b:(); c:())



meta ([] a:(); b:(); c:())












\\
