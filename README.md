# The Zotero Ruby Gem [![Build Status](https://secure.travis-ci.org/waynegraham/rZotero.png?branch=clean_rewrite)][travis] [![Dependency Status](https://gemnasium.com/waynegraham/rZotero.png?travis)][gemnasium]

A Ruby wrapper for the Zotero API.

[travis]: http://travis-ci.org/waynegraham/rZotero
[gemnasium]: https://gemnasium.com/waynegraham/rZotero

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zotero'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zotero

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Documentation

[documenation]: http://rdoc.info/gems/zotero

[follow]: https://twitter.com/waynegraham

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zotero. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## <a name="versions"></a>Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 2.4.0
* Ruby 2.3.0
* [JRuby][]

[jruby]: http://www.jruby.org/

If something doesn't work on one of these interpreters, it should be considered
a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## <a name="copyright"></a>Copyright
Copyright (c) 2010 Wayne Graham. See [LICENSE][] for details.

[license]: https://github.com/waynegraham/zotero/blob/master/LICENSE.txt
