use v6.c;

use Test;
use lib 'lib';
use TimeUnit;

plan 6;

is SECONDS.to-nanos(1), 1000 * 1000 * 1000, '1 sec to nonos';
is SECONDS.to-nanos(0.5), 500 * 1000 * 1000, 'half sec to nonos';
is DAYS.to-seconds(15), 15 * 86400, '15 days to sec';
is MICROSECONDS.to-hours(HOURS.to-micros(5)), 5, '5 hours to microseconds and back';
is NANOSECONDS.to-hours(432), 0.00000000012, '432 nanosecond to hours';
is HOURS.from(90, MINUTES), 1.5, '1.5 hours from 90 minutes';

done-testing;