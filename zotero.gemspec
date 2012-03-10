# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zotero/version"

Gem::Specification.new do |gem|
  gem.name        = "zotero"
  gem.version     = Zotero::VERSION
  gem.authors     = ["Wayne Graham"]
  gem.email       = ["wayne.graham@virginia.edu"]
  gem.homepage    = "https://github.com/waynegraham/zotero"
  gem.summary     = %q{Zotero API wrapper}
  gem.description = %q{A Ruby wrapper for the Zotero API}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.post_install_message =<<eos
********************************************************************************

  You should follow @wayne_graham on Twitter for announcement and updates about
  the gem. https://twitter.com/wayne_graham

  Please direct any issues to the issue tracker on Github 
  https://github.com/waynegraham/zotero/issues

********************************************************************************
eos

  # specify any dependencies here; for example:
  gem.add_runtime_dependency 'faraday', '~> 0.7'

  gem.add_development_dependency "rspec"
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'yard'
  # gem.add_runtime_dependency "rest-client"
end
