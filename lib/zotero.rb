require File.expand_path('../zotero/error', __FILE__)
require File.expand_path('../zotero/configuration', __FILE__)
require File.expand_path('../zotero/api', __FILE__)
require File.expand_path('../twitter/base', __FILE__)

module Zotero
  
  extend Configuration
  
  # Alias for Zotero::Client.new
  #
  # @return [Zotero::Client]
  def self.client(options={})
    Zotero::client.new(options)
  end
  
  # Delegate to Zotero::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
  
end