## messing-around-with-perl6

Some examples of perl6.

* circle - Draws circles of asterisks.
* ho - Draws a diamond of "ho"s.
* iloveyou - Tool of annoyance.
* kbd - Keyboard reading test. Requires stty to be available.

### A note about key delay

Some applications don't work well with key repeat delay. You can reduce
this delay by using OS-specific utilities.

(Note: set the interval lower than your program's key polling interval.)

#### Ubuntu

[kbdrate](http://manpages.ubuntu.com/manpages/trusty/man8/kbdrate.8.html) is
included in your distribution.

#### Windows

See [this utility](http://tetzfiles.com/eric/code/keyrate.zip) with source
included. Usage is `keyrate <delay> <repeat>`. Use `keyrate` without arguments
in order to disable the override.

The author of this program, who goes by the handle "Mud" on StackOverflow,
has [allowed its redistribution without restrictions](http://stackoverflow.com/questions/171326/how-can-i-increase-the-key-repeat-rate-beyond-the-oss-limit/11056655?noredirect=1#comment54131685_11056655).
