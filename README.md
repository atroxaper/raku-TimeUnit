[![Ubuntu](https://github.com/atroxaper/raku-TimeUnit/actions/workflows/ubuntu.yml/badge.svg)](https://github.com/atroxaper/raku-TimeUnit/actions/workflows/ubuntu.yml)
[![MacOS](https://github.com/atroxaper/raku-TimeUnit/actions/workflows/macos.yml/badge.svg)](https://github.com/atroxaper/raku-TimeUnit/actions/workflows/macos.yml)
[![Windows](https://github.com/atroxaper/raku-TimeUnit/actions/workflows/windows.yml/badge.svg)](https://github.com/atroxaper/raku-TimeUnit/actions/workflows/windows.yml)
[![Coverage Status](https://coveralls.io/repos/github/atroxaper/raku-TimeUnit/badge.svg?branch=master)](https://coveralls.io/github/atroxaper/raku-TimeUnit?branch=master)

# NAME

`TimeUnit` - library for conversion a time from one unit to another.

# SYNOPSIS

<pre lang="raku">
use TimeUnit;

sub beep-after(<b>TimeUnit:D $time</b>) {
    Promise.in(<b>$time.to-seconds</b>).then: { beep() }
}

Promise.in(<b>timeunit(:3days :1hour :3sec).to-seconds</b>).then: { send-email() }

<b>days(4) + hours(3).minus(nanos(3)) < timeunit(:4d :3h);</b>

<b>minutes(15).to(hours) == 0.25;</b>
</pre>

# INSTALLATION

If you use zef, then `zef install TimeUnit`, or `pakku add TimeUnit` if you use Pakku.

# DESCRIPTION

`TimeUnit` library provides a simple way for conversion time without any 'magic numbers' in code. Also, `TimeUnit` can help you to write a more intuitive API in part of using time.

You may use the following routines to create corresponding `TimeUnit` object: `nanos`, `micros`, `millis`, `seconds`, `minutes`, `hours` and `days`. All of them take a single `Numeric()` argument. Additionally, you may create `TimeUnit` object through `timeunit` routing in a relaxed way like `timeunit(:1day :3h :6nanoseconds)`.

`TimeUnit` object can be compared as ordinary Numerics. Also, you may add and subtract them with `infix:<+>` and `infix:<->` routines and `plus` and `minus` methods.

To convert `TimeUnit` object to some numeric representation use one of the following method: `to-nanos`, `to-micros`, `to-millis`, `to-seconds`, `to-hours`, `to-days` or simply `to('days')`. It is possible to pass a name of unit to `to` method with or without quotation.

# AUTHOR

Mikhail Khorkov <atroxaper[at]cpan.org>

Sources can be found at: [github](https://github.com/atroxaper/raku-TimeUnit). The new Issues and Pull Requests are welcome.

# COPYRIGHT AND LICENSE

Copyright 2022 Mikhail Khorkov

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
