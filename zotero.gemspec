# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zotero/version'

Gem::Specification.new do |spec|
  spec.name          = "zotero"
  spec.version       = Zotero::VERSION
  spec.authors       = ["Wayne Graham"]
  spec.email         = ["wgraham@clir.org"]

  spec.summary       = %q{Ruby wrapper for Zotero API}
  spec.description   = %q{Ruby wrapper for Zotero API}
  spec.homepage      = "https://github.com/waynegraham/rZotero"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0.3"
  spec.add_development_dependency "webmock", "~> 2.3.2"

  spec.add_dependency "faraday", "~> 0.11.0"
  spec.add_dependency "json", "~> 2.0.3"
  spec.add_dependency "oauth-active-resource", "0.4.7"
  spec.add_dependency "oauth", "~> 0.5.1"
end
