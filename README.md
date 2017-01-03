idiosyncratic ruby solution to the problem presented in [A simple but difficult arithmetic puzzle, and the rabbit hole it took me down](http://composition.al/blog/2016/12/31/a-simple-but-difficult-arithmetic-puzzle-and-the-rabbit-hole-it-took-me-down/)

```
jes5199$ ruby lindseynums.rb 6 6 5 2 17
6\5+2*6=17.0
5/6+2*6=17.0
jes5199$ ruby lindseynums.rb 8 8 3 3 24
8/3~3\8=24.0
3\8~3\8=24.0
```

Output includes two idiosyncratic arithmetic operators:
* backslash means "under", which is just division with the terms reversed
* tilde means "un-minus", which is just subtraction with the terms reversed

Also, the operations should be read as if they were performed left-to-right,
all with equal precedence.
