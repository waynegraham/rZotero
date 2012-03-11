require "zotero/version"

require 'zotero/client'
require 'zotero/config'

module Zotero
  extend Config

  class << self
    # Alias for Zotero::Client.new
    #
    # @return [Zotero::Client.new]
    def new(options={})
      Zotero::Client.new(options)
    end

    # Delegate to Zotero::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
