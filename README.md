# Jekyll::Asciinema

[![Build Status][badge-travis]][travis]
[![Coverage Status][badge-coveralls]][coveralls]
[![Gem Version][badge-gem]][rubygems]
[![Dependency Status][badge-deps]][gemnasium]
[![Code Climate][badge-gpa]][codeclimate]

Provides a [Liquid][liquid] tag for embedding asciicasts recorded with
[asciinema][asciinema] for use in [Jekyll][jekyll] sites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-asciinema'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-asciinema

## Usage

Use the tag as follows in your Jekyll pages and posts:

    {% asciicast 123 %}

This will render the associated script tag:

    <script type="text/javascript" src="https://asciinema.org/a/123.js" id="asciicast-123" async="async"></script>

Replace "123" with the real ID of the asciicast to embed.

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `bin/console` for an interactive prompt that will allow you
to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release` to create a git
tag for the version, push git commits and tags, and push the `.gem`
file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/mnuessler/jekyll-asciinema/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Code is under [MIT License][license].

[badge-travis]: https://travis-ci.org/mnuessler/jekyll-asciinema.svg?branch=master
[badge-coveralls]: https://coveralls.io/repos/mnuessler/jekyll-asciinema/badge.svg
[badge-gem]: https://badge.fury.io/rb/jekyll-asciinema.svg
[badge-deps]: https://gemnasium.com/mnuessler/jekyll-asciinema.svg
[badge-gpa]: https://codeclimate.com/github/mnuessler/jekyll-asciinema/badges/gpa.svg
[travis]: https://travis-ci.org/mnuessler/jekyll-asciinema
[coveralls]: https://coveralls.io/r/mnuessler/jekyll-asciinema
[rubygems]: https://rubygems.org/gems/jekyll-asciinema
[gemnasium]: https://gemnasium.com/mnuessler/jekyll-asciinema
[codeclimate]: https://codeclimate.com/github/mnuessler/jekyll-asciinema
[liquid]: http://liquidmarkup.org "Liquid templating language"
[asciinema]: https://asciinema.org "Asciinema"
[jekyll]: http://jekyllrb.com "Jekyll"
[license]: https://raw.githubusercontent.com/mnuessler/jekyll-asciinema/master/LICENSE.txt
