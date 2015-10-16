use v6;
#use IO::Handle;
#use IO::Socket;

#say $*IN.t;

shell "stty raw -echo time 1";

my $timeout = 0.1;
my $chan = Channel.new;
my $cancellation = $*SCHEDULER.cue({
  for 0 ..^ 1 {
    my ($b, $ts) = $chan.poll;
    if $ts && now - $ts > $timeout {
      if $b && $b == 27 {
        my ($c, $) = $chan.poll;
        my ($d, $) = $chan.poll;
        # print "[$c $d] ";
      }
      redo;
    }
    if $b && $b == 27 {
      my ($c, $) = $chan.poll;
      my ($d, $) = $chan.poll;
      given $c {
        when 91 {
          given $d {
            when 65 { print "<up> "; }
            when 66 { print "<down> "; }
            when 67 { print "<right> "; }
            when 68 { print "<left> "; }
          }
        }
      }
    }
    elsif $b { print "<$b> "; }
    else { print "<nothing> "; }
  }
}, every => $timeout);

loop {
  $*IN.flush;
  my $b = $*IN.read(1)[0];
  # my $c = $b.decode;
  $chan.send(($b, now));
  #print "<<$b>> ";
  last if $b == 113;
}

END shell "stty cooked echo";
