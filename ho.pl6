#!/usr/bin/perl6

use v6;

my \size = 10;

sub printLine($before) {
  print "  " x $before;
  print "ho";
  if ($before != size) {
    print "  " x ((size - $before) * 2 - 1);
    print "ho";
  }
  print "\n";
}

for reverse 0 ^.. size {
  printLine($_);
}
for 0 .. size {
  printLine($_);
}
