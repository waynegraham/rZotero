require 'faraday'
require File.expand_path('../version', __FILE__)

module Zotero
  module configuration
    # An array of valid keys in the options hash when configuring a {Zotero::API}
    VALID_OPTION_KEYS = [:key, :user, :format, :key, :version, :content, :order, :sort, :limit, :start, :pprint, :style].freeze
    
    # An array of valid request/response formats
    #
    # @note Not all methods support ATOM and bib formats
    VALID_FORMATS = [:atom, :xml, :raw, :bib].freeze
    
    # By default, don't set a key
    DEFAULT_KEY = nil.freeze
    
    # The Faraday adapter that will be used to connect if none is set
    #
    # @note the default Faraday adapter is Net::HTTP
    DEFAULT_ADAPTER = Faraday.default_adapter.freeze
    
    # The endpoint that will be used to connect to Zotero if none is set
    #
    # @note This is configurable in case the connection is changed beofre the URI
    DEFAULT_ENDPOINT = 'https://api.zotero.org/'.freeze
    
    # The response format appended to the path and sent in the 'Accept' header if non is set
    #
    # @note The default is the largest, most difficult to parse
    DEFAULT_FORMAT = :raw.freeze
    
    # By default, don't use a proxy server
    DEFAULT_PROXY = nil.freeze
    
    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Zotero Ruby Gem #{Zotero::VERSION}".freeze
    
    # By default, don't set a screen name
    DEFAULT_SCREEN_NAME = nil.freeze
    
    # @private
    private
    attr_accesstor *VALID_OPTIONS_KEYS
    
    # When this module is extended, set all configuration options to their defaults
    def self.extended(base)
      base.reset
    end
    
    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
    
    # reset configuration options to defaults
    def reset
      self.adapter     = DEFAULT_ADAPTER
      self.endpoint    = DEFAULT_ENDPOINT
      self.format      = DEFAULT_FORMAT
      self.proxy       = DEFAULT_PROXY
      self.user_agent  = DEFAULT_USER_AGENT
      self.screen_name = DEFAULT_SCREEN_NAME
    end
    
  end
end