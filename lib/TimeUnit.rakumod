use v6.c;

my constant nano = 1;
my constant micro = nano * 1000;
my constant milli = micro * 1000;
my constant sec = milli * 1000;
my constant min = sec * 60;
my constant hour = min * 60;
my constant day = hour * 24;

enum UnitTimeName (
  nanos => nano,
  micros => micro,
  millis => milli,
  seconds => sec,
  minutes => min,
  hours => hour,
  days => day
);

#|[Class for representing a time unit like nanosecond or hour
#
# Class is private. You can use corresponding instances like nanos or hours.]
class TimeUnit {
  has $!nano is built;
  method !nano() { $!nano }

  method to-nanos(TimeUnit:D: --> Numeric:D) { $!nano }
  method to-micros(TimeUnit:D: --> Numeric:D) { $!nano / micro }
  method to-millis(TimeUnit:D: --> Numeric:D) { $!nano / milli }
  method to-seconds(TimeUnit:D: --> Numeric:D) { $!nano / sec }
  method to-minutes(TimeUnit:D: --> Numeric:D) { $!nano / min }
  method to-hours(TimeUnit:D: --> Numeric:D) { $!nano / hour }
  method to-days(TimeUnit:D: --> Numeric:D) { $!nano / day }
  multi method to(TimeUnit:D: UnitTimeName:D $unit --> Numeric:D) { $!nano / $unit.value }
  multi method to(TimeUnit:D: Str:D $unit --> Numeric:D) {
    $!nano / UnitTimeName::{$unit}.value
  }

  multi method plus(TimeUnit:D: TimeUnit:D $plus --> TimeUnit:D) {
    create($!nano + $plus!nano, 'n')
  }
  multi method plus(TimeUnit:D: |c --> TimeUnit:D) {
    create($!nano + nanos-from(|c), 'n')
  }
  multi method minus(TimeUnit:D: TimeUnit:D $plus --> TimeUnit:D) {
    create($!nano - $plus!nano, 'n')
  }
  multi method minus(TimeUnit:D: |c --> TimeUnit:D) {
    create($!nano - nanos-from(|c), 'n')
  }

  method WHICH(TimeUnit:D: --> ValueObjAt:D) {
    ValueObjAt.new("TimeUnit|$!nano");
  }

  method Real() { $!nano }

  method Numeric() { $!nano }
}

sub create($n, $unit) {
  TimeUnit.new: nano => nanos-from(|($unit => $n));
}

sub nanos(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'n') }
sub micros(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'mic') }
sub millis(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'mil') }
sub seconds(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'sec') }
sub minutes(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'min') }
sub hours(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'h') }
sub days(Numeric() $n where * >= 0 --> TimeUnit:D) is export { create($n, 'd') }
multi sub timeunit(Numeric() $n where * >= 0, UnitTimeName:D $unit --> TimeUnit:D) is export {
  create($n, $unit.key)
}
multi sub timeunit(|c --> TimeUnit:D) is export {
  create(nanos-from(|c), 'n');
}
multi sub infix:<+>(TimeUnit:D $l, TimeUnit:D $r --> TimeUnit:D) is export { $l.plus($r) }
multi sub infix:<->(TimeUnit:D $l, TimeUnit:D $r --> TimeUnit:D) is export { $l.minus($r) }

multi sub nanos-from(
    Numeric() :d(:day(:$days)) where { $_ >= 0 } = 0,
    Numeric() :h(:hour(:$hours)) where { $_ >= 0 } = 0,
    Numeric() :min(:minute(:$minutes)) where { $_ >= 0 } = 0,
    Numeric() :s(:sec(:second(:$seconds))) where { $_ >= 0 } = 0,
    Numeric() :mil(:milli(:millisecond(:milliseconds(:$millis)))) where { $_ >= 0 } = 0,
    Numeric() :mic(:mocro(:microsecond(:microseconds(:$micros)))) where { $_ >= 0 } = 0,
    Numeric() :n(:nano(:nanosecond(:nanoseconds(:$nanos)))) where { $_ >= 0 } = 0,
    |c
    --> Numeric:D
) {
  nextwith(|c) if c;
  $nanos * nano +
      $micros * micro +
      $millis * milli +
      $seconds * sec +
      $minutes * min +
      $hours * hour +
      $days * day
}

#| Fallback to die
multi sub nanos-from(|c) {
  die "With TimeUnit you only can use named parameters:\n" ~
      "nanos, micros, millis, seconds, minutes, hours, days.\n" ~
      "But you specified: [{c}].";
}
