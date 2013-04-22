# Spy on yourself and be merry.

Spying? Spooky!
OTOH, that helps you to yield interesting metrics from your own day.
All metrics are subjective, but as long as they're consistent and used wisely, they
may yield some interesting info. In the end, it doesn't cost anything to log all that stuff, right?

## Installation

Add this line to your application's Gemfile:

    gem 'keylogger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install keylogger

## Usage

WORKS ONLY WITH MACRUBY!!!!

```sh
macruby -S bundle install
macruby -S rake keylogger:log
```

## For analysis:

```clojure
(def alpha-shift-key-mask   (bit-shift-left 1 16)
(def shift-key-mask         (bit-shift-left 1 17)
(def control-key-mask       (bit-shift-left 1 18)
(def alternate-key-mask     (bit-shift-left 1 19)
(def command-key-mask       (bit-shift-left 1 20)
(def numeric-pad-key-mask   (bit-shift-left 1 21)
(def help-key-mask          (bit-shift-left 1 22)
(def function-key-mask      (bit-shift-left 1 23)

(bit-and 131332 (bit-shift-left 1 17))
```

## Contributing

Probably you're not reading this anyways.

## License

Copyright (C) 2011-2012 Alex Petrov

Distributed under the Ruby License.
