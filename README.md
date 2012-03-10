# The Zotero Ruby Gem

A Ruby wrapper for the Zotero API.

[travis]: http://travis-ci.org/waynegraham/zotero
[gemnasium]: https://gemnasium.com/waynegraham/zotero

## <a name="installation"></a>Installation
    
    gem install zotero

## <a name="documentation"></a>Documentation

[documenation]: http://rdoc.info/gems/zotero

[follow]: https://twitter.com/waynegraham

## <a name="contributing"></a>Contributing

In the spirit of [free software][free-sw], **everyone** is encourage to
contribute to this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and pre-release versions
* by reporting bugs
* by suggesting new features
* by writing or editing documenation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments,
  clean up inconsistent whitespace, etc.)
* by refactoring code
* by closing [issues][]
* by reviewing patches
* [finacially][]

[issues]: https://github.com/waynegraham/zotero/issues
[financially]: http://pledgie.com/campaigns/

All contributors will be added to the [history][] and will receive the
respect and gratitude of the community.

[history]: https://github.com/waynegraham/zotero/blob/master/HISTORY.md

## <a name="issues"></a>Submitting and Issue

We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. You can indicate support for an existing issue by
voting it up. When submitting a bug report, please include a [gist][] that
includes a stack trace and any details that may be necessary to reproduce the
bug, including your gem version, Ruby version, and operating system. Ideally, a
bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## <a name="pulls"></a>Submitting a Pull Request
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run `bundle exec rake yard`. If your changes are not 100% documented, go
   back to step 4.
6. Add specs for your feature or bug fix.
7. Run `bundle exec rake spec`. If your changes are not 100% covered, go back
   to step 6.
8. Commit and push your changes.
9. Submit a pull request. Please do not include changes to the gemspec,
   version, or history file. (If you want to create your own version for some
   reason, please do so in a separate commit.)

## <a name="versions"></a>Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.9.2
* Ruby 1.9.3
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

[license]: https://github.com/waynegraham/zotero/blob/master/LICENSE

