[![Build Status](https://travis-ci.org/atroxaper/p6-TimeUnit.svg?branch=master)](https://travis-ci.org/atroxaper/p6-TimeUnit)

TimeUnit
========

Library for conversion a time unit to another.

Purpose
-------

* Add possibility to use different time units in
code - not only seconds:

        sub beep-after($time, TimeUnit:D $unit) { ... }
        beep-after(5, HOURS);
        beep-after(3, SECONDS);

* Add a simple way for conversion time units from
one to another without any 'magic numbers' in code:

        say 'In 36 hours contains ', HOURS.to-seconds(36), ' seconds.';

Exported constants
------------------

**NANOSECONDS** - just nanoseconds;

**MICROSECONDS** - is a thousand of nanoseconds;

**MILLISECONDS** - is a thousand of microseconds;

**SECONDS** - is a thousand of milliseconds;

**MINUTES** - is sixty seconds;

**HOURS** - is sixty minutes;

**DAYS** - is twenty four hours;

Available methods
-----------------

With any constants you can use methods **from**, **to-nanos**, **to-micros**, **to-millis**,
**to-seconds**, **to-minutes**, **to-hours**, **to-days** for conversion numbers 
from one unit to another like this:

        NANOSECONDS.to-hours(432); # convert 432 nanosecons to 0.00000000012 hour
        HOURS.from(90, MINUTES);   # retrieve 1.5 hours from 90 minutes

AUTHOR
------

Mikhail Khorkov <atroxaper@cpan.org>

LICENSE
-------

See [LICENSE](LICENSE) file for the details of the license of the code in this repository.

       



