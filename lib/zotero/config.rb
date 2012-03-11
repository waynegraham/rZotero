require 'zotero/version'

module Zotero

  # Defines constants and methods related to configuration
  module Config

    # HTTP connection adapter to use if none is set
    DEFAULT_ADAPTER = :net_http

    # Faraday connection options if none are set
    DEFAULT_CONNECTION_OPTIONS = {}

    # Default key if none is set
    DEFAULT_KEY = nil

    # Default secret if none is set
    DEFAULT_SECRET = nil

    # Endpoint to use if none is set
    DEFAULT_ENDPOINT = 'https://api.zotero.org'

    # OAuth token if none is set
    DEFAULT_OATH_TOKEN = nil

    # OAuth token secret to use if none is set
    DEFAULT_OATH_TOKEN_SECRET = nil

    # Proxy server to use if none is set
    DEFAULT_PROXY = nil

    # Search endpoint to use to connect if none is set
    DEFAULT_SEARCH_ENDPOINT = 'https://api.zotero.org'

    # Value set in 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "Zotero Ruby Gem #{Zotero::VERSION}"

    # Array of valid keys in the options hash when configuring a
    # {Zotero::Client}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :connection_options,
      :zotero_key,
      :zotero_secret,
      :endpoint,
      :oauth_token,
      :oauth_token_secret,
      :proxy,
      :search_endpoint,
      :user_agent,
      :media_endpoint
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When extending this module, reset all configuration options to
    # their default values
    def self.extend(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a
    # block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.zotero_key         = DEFAULT_KEY
      self.zotero_secret      = DEFAULT_SECRET
      self.endpoint           = DEFAULT_ENDPOINT
      self.oauth_token        = DEFAULT_OATH_TOKEN
      self.oauth_token_secret = DEFAULT_OATH_TOKEN_SECRET
      self.proxy              = DEFAULT_PROXY
      self.search_endpoint    = DEFAULT_SEARCH_ENDPOINT
      self.user_agent         = DEFAULT_USER_AGENT
      self
    end
  end
end
