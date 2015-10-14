#!/usr/bin/perl6

use v6;

for lines() {
  my $starCount = +$_;
  my $radius = ceiling($starCount * sqrt(2) / pi);
  my $size = $radius * 2 + 1;
  my $area = $size ** 2;
  my @output = " " xx $area;
  for 0 ..^ $starCount {
    my $a = $_ * 2 * pi / $starCount;
    my $r = round($radius * (1 + cos($a)));
    my $c = round($radius * (1 + sin($a)));
    @output[$r * $size + $c] = "*";
  }
  loop (my $i = 0; $i < $area; ++$i) {
    print " ", @output[$i], " ";
    print "\n" if (($i + 1) % $size == 0);
  }
}
