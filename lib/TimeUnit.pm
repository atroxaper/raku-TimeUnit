use v6.c;

my constant nano = 1;
my constant micro = nano * 1000;
my constant milli = micro * 1000;
my constant sec = micro * 1000;
my constant min = sec * 60;
my constant hour = min * 60;
my constant day = hour * 24;

my class TimeUnit {
  has Str $.name;
  has Int $.nanos-volume;

  method toNanos($d) {
    $d * ($!nanos-volume / nano);
  }

  method toMicros($d) {
    $d * ($!nanos-volume / micro);
  }

  method toMillis($d) {
    $d * ($!nanos-volume / milli);
  }

  method toSeconds($d) {
    $d * ($!nanos-volume / sec);
  }

  method toMinutes($d) {
    $d * ($!nanos-volume / min);
  }

  method toHours($d) {
    $d * ($!nanos-volume / hour);
  }

  method toDays($d) {
    $d * ($!nanos-volume / day);
  }

  method from($d, TimeUnit:D $u) {
    $d * ($u.nanos-volume / $!nanos-volume);
  }
}

constant NANOSECONDS  = TimeUnit.new: name => 'NANOSECOND',   nanos-volume => 1;
constant MICROSECONDS = TimeUnit.new: name => 'MICROSECONDS', nanos-volume => nano;
constant MILLISECONDS = TimeUnit.new: name => 'MILLISECONDS', nanos-volume => micro;
constant SECONDS      = TimeUnit.new: name => 'SECONDS',      nanos-volume => milli;
constant MINUTES      = TimeUnit.new: name => 'MINUTES',      nanos-volume => min;
constant HOURS        = TimeUnit.new: name => 'HOURS',        nanos-volume => hour;
constant DAYS         = TimeUnit.new: name => 'DAYS',         nanos-volume => day;



