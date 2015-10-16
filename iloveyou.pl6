use v6;

sub MAIN(Int $seconds = 60, Int $times = 60) {
  for 0 ..^ $times {
    sleep($seconds);
    say "($_) ILOVEYOU!\a";
  }
  sleep(1);
  say "ILOVEYOU!!!!!!!!!!!!!!!!!!!!!!!!!!";
}
