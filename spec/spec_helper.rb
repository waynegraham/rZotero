require 'simplecov'

SimpleCov.start do
  add_group 'Zotero', 'lib/zotero'
  add_group 'Faraday Middleware', 'lib/faraday'
  add_group 'Specs', 'spec'
end

require File.expand_path('../../lib/twitter', __FILE__)

require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end

def a_get(path)
  a_request(:get, Zotero.endpoint + path)
end

def stub_get(path)
  stub_request(:get, Zotero.endpoin + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end