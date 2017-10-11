use v6.c;

my constant nano = 1;
my constant micro = nano * 1000;
my constant milli = micro * 1000;
my constant sec = milli * 1000;
my constant min = sec * 60;
my constant hour = min * 60;
my constant day = hour * 24;

#|[Class for representing a time unit like nanosecond or hour.
#
# Class is private. You can use corresponding instances like NANOSECONDS or HOUR.
#]
my class TimeUnit {
  has Str $.name;
  has Int $.nanos-volume;

  #|Convert specified number from current unit to nanoseconds.
  method to-nanos($d) {
    $d * ($!nanos-volume / nano);
  }

  #|Convert specified number from current unit to microseconds.
  method to-micros($d) {
    $d * ($!nanos-volume / micro);
  }

  #|Convert specified number from current unit to milliseconds.
  method to-millis($d) {
    $d * ($!nanos-volume / milli);
  }

  #|Convert specified number from current unit to seconds.
  method to-seconds($d) {
    $d * ($!nanos-volume / sec);
  }

  #|Convert specified number from current unit to minutes.
  method to-minutes($d) {
    $d * ($!nanos-volume / min);
  }

  #|Convert specified number from current unit to hours.
  method to-hours($d) {
    $d * ($!nanos-volume / hour);
  }

  #|Convert specified number from current unit to days.
  method to-days($d) {
    $d * ($!nanos-volume / day);
  }

  #|Convert specified number from specified unit to current unit.
  method from($d, TimeUnit:D $u) {
    $d * ($u.nanos-volume / $!nanos-volume);
  }
}

constant NANOSECONDS  = TimeUnit.new: name => 'NANOSECOND',   nanos-volume => nano;
constant MICROSECONDS = TimeUnit.new: name => 'MICROSECONDS', nanos-volume => micro;
constant MILLISECONDS = TimeUnit.new: name => 'MILLISECONDS', nanos-volume => milli;
constant SECONDS      = TimeUnit.new: name => 'SECONDS',      nanos-volume => sec;
constant MINUTES      = TimeUnit.new: name => 'MINUTES',      nanos-volume => min;
constant HOURS        = TimeUnit.new: name => 'HOURS',        nanos-volume => hour;
constant DAYS         = TimeUnit.new: name => 'DAYS',         nanos-volume => day;



