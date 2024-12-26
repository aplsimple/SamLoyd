# What's that

This puzzle's idea is borrowed from the book *Mathematical Puzzles* by V. N. Dubrovsky and A. T. Kalinin.

The task of the puzzle is to rotate *Puzzled* pieces so that they compose *Wanted* pattern, as for numbers.

The pieces are included in two glued cycles: left and right. Both are rotated clockwise or counter-clockwise.

To rotate a cycle, click and drag its piece and drop it on one of its neighbors.

Clicking a puzzle pattern or entering *Difficulty* value starts a new puzzle.

Clicking the button *Restart* restarts the current puzzle.

Other buttons allow:

   * to save the current puzzle
   * to restore the saved puzzle
   * show one of possible solutions

The puzzle can be run so:

    tclsh gluedcycles.tcl ?RESOURCE?

where RESOURCE - path to .rc file, by default *./gluedcycles.rc*


# Links

   * [Chiselapp repository](http://chiselapp.com/user/aplsimple/repository/SamLoyd/index)
   * [Github repository](https://github.com/aplsimple/SamLoyd)


# Pictures

Solving:

<img src="https://github.com/aplsimple/SamLoyd/releases/download/SamLoyd-0.0.1/gluedcycles1.png" class="media" alt="">

Solved:

<img src="https://github.com/aplsimple/SamLoyd/releases/download/SamLoyd-0.0.1/gluedcycles2.png" class="media" alt="">


# What else

The puzzles are presented in sporadic way, with shuffling their pieces. The number of shuffles is displayed in *Puzzled* field, e.g. so: "*Puzzled: moves 5 / 15*", where 5 - currently made moves, 15 - number of shuffles.

Normally, the more shuffles, the harder.

The solution offered by the program is in no way the best. The solution moves are the same shuffles, just rolled back. Thus, the solution is often *stupid* in the sense that it contains unnecessary moves.

But sometimes the solution is smart. Also, some puzzles are trivial, while others are pretty hard, few being even beautiful.

When some puzzle seems to be interesting, you can save it with *Save* button, to restore it with *Restore* button some day. Anyhow, a current puzzle is saved "on fly" to be restored in the program's next session.

And when the puzzle seems to be hard, you can make it easier with clicking *Show solution* button till the horizon becomes clearer.

A good idea of this puzzle is *to overcome the computer*, making less moves to solution than the program offers. The saved puzzle of [the program's repository](http://chiselapp.com/user/aplsimple/repository/SamLoyd/download) illustrates this.
