# Maze Solver
This is a (soon to be) collection of maze solving algorithms based off my cs classes and also my own research. For an interactive example of all the algorithms in action, check out my implementation at [link to esbildman](http://esbildman.com/projects/maze).

### Input

To use the solver from the command line the syntax is as follows:
```
./build/MazeSolver [algorithm] [maze description]
```

Where 'maze description' refers to a binary list over all the cells starting at (0, 0) maving right then upward that defines which cells represent walls. The length of the list should be the sqaure of the desired side length of the maze. Mazes are always solved from the bottom left to the top rightmost cells.

A maze that looks like:
```
0   0   0   0
1   1   0   1
0   0   0   1
0   1   0   1
```


```
./build/MazeSolver [algorithm] 0 1 0 1 0 0 0 1 1 1 0 1 0 0 0 0
```

### Output

The Solver outputs a series of coordinates in the format
```
(x, y)
```
seperated by newlines.

For the example above, the output would be:
```
0, 0
0, 1
1, 1
2, 1
2, 2
2, 3
3, 3
```

Check out http://esbildman.com to see my other projects.