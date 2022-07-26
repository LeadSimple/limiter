# CHANGELOG

## v3.3.0

- Add a new `Ring#configure` method allowing you to set a specific Redis instance to be used by `limiter`
-

## v3.2.1

- Properly alias `#check!` method to be called in the queues instead of `shift` by using [`forwardable`](https://ruby-doc.org/stdlib-2.6.3/libdoc/forwardable/rdoc/Forwardable.html)

## v3.2.0

- Add an alias `#check!` method to be called in the queues instead of `shift`

## v3.1.0

- Set a more specific queue default name for redis-based queues

## v3.0.1

- Stop calling Redis on initialization

## v3.0.0

- Add support to redis-based queues for distributed systems

## v2.2.2

- security update to rake 13.0.6 [CVE-2020-8130]

## v2.2.0

- adds support for "balancing" requests over time

## v2.1.0

- add support to call a block when limiting takes place

## v2.0.1

- eliminate kwarg warning in ruby 2.7 (while still supporting 2.6)

## v2.0.0

- end support for ruby 2.3/2.4/2.5
- test on ruby 2.6/2.7/3.0 (using ruby 2.7 for development)

## v1.1.0

- using Process.clock_gettime(Process::CLOCK_MONOTONIC) instead of Time.now for improved accuracy

## v1.0.2

- DOCFIX: fix name of gem in README
- BUGFIX: add ruby-limiter.rb so that it works better with bundler

## v1.0.1

- BUGFIX: support arguments for throttled methods

## v1.0.0

- initial release
