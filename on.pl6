use v6;

# ONLY THE INITIATED MAY UNDERSTAND THIS PROGRAM

sub getCurrentDateHash($d) {
  return DateTime.new(:date($d)).Instant.Int;
}

constant ERR = "blarghblargh!\n";
constant X1 = 67;
constant X2 = 3989;
constant Y1 = 41;
constant Y2 = 4253;
constant TB = "s0", "s2", "s3", "s4", 2, 3, 4;
constant BX = "i", "yo";
constant BY = "ni", "he", "no";
constant HT = "峰", "谷", "坂";
constant GJ = "速", "波", "寝";

sub rf($p = 0.5) {
  return rand < $p;
}

sub outMKUR() {
  my $m = rf;
  my $k = rf;
  my $u = rf;
  if ($k && !$m) {
    outMKUR();
    return;
  }
  my $r = $k ^^ rf(0.1);
  print "m" if $m;
  print "k" if $k;
  print "u" if $u;
  print "r" if $r;
  print "-" if !($m || $k || $u || $r);
  print " ";
  return $k;
}

sub MAIN($gh, $ds = Nil) {
  if !($gh ~~ any("m", "f")) {
    note ERR;
    exit 1;
  }
  my $g = $gh eq "f";
  my $a = $g ?? X1 !! Y1;
  my $b = $g ?? X2 !! Y2;
  my $today = Date.today;
  my $d = $ds ?? Date.new($ds) !! $today;
  my $k;
  if $d > $today {
    note ERR;
    exit 2;
  }
  srand $a * getCurrentDateHash($d) + $b;
  say 16.rand.floor;
  if rf(0.07) {
    print "H ";
    $k = outMKUR();
    print "M ";
    $k = $k || outMKUR();
  }
  else {
    print "HM ";
    $k = outMKUR();
  }
  my $s = rf(0.2);
  my $w = rf(0.2);
  print "S" if $s;
  print ")" if $w;
  print " " if $s || $w;
  if $s || rf(0.6) {
    say 2 + 3.rand.floor;
  } else {
    say TB[*.rand];
  }
  if !$w {
    if rf(0.2) {
      print "<";
      print "=" if rf(0.05);
      print " ";
    }
  }
  if $g {
    print BX[*.rand];
  } else {
    print BY[*.rand];
  }
  print " ";
  print HT[*.rand], " " if !$k;
  print GJ[*.rand], " ";
  if rf(0.7) {
    print "砂漠";
  } elsif rf(0.92) {
    print "霧雨";
  } else {
    print "蛇一";
  }
}
