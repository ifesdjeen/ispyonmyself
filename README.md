# Spy on yourself and be merry.

Here's how I spy on myself

## Installation

Add this line to your application's Gemfile:

    gem 'keylogger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install keylogger

## Usage

macruby -S bundle install
macruby -S rake keylogger:log

(def alpha-shift-key-mask   (bit-shift-left 1 16)
(def shift-key-mask         (bit-shift-left 1 17)
(def control-key-mask       (bit-shift-left 1 18)
(def alternate-key-mask     (bit-shift-left 1 19)
(def command-key-mask       (bit-shift-left 1 20)
(def numeric-pad-key-mask   (bit-shift-left 1 21)
(def help-key-mask          (bit-shift-left 1 22)
(def function-key-mask      (bit-shift-left 1 23)

(bit-and 131332 (bit-shift-left 1 17))

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (C) 2011-2012 Alex Petrov

Distributed under the Ruby License.
