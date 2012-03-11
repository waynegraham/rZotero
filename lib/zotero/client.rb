module Zotero

  require 'zotero/config'
  require 'zotero/user'

  # Wrapper for the Zotero REST API
  #
  # @note All methods have been separated into modules and follow the
  # groupings used in {http://www.zotero.org/support/dev/server_api the
  # Zotero API Documentation}
  # @see http://www.zotero.org/support/dev/server_api
  class Client

    attr_accessor *Config::VALID_OPTIONS_KEYS


    # Initialized a new API object
    #
    # @param attrs [Hash]
    # @return [Zotero::Client]
    def initialize(attrs={}) 
      attrs = Zotero.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end

    # Returns the configured screen anem or the screen name of the
    # authenticated user
    #
    # @return [Zotero::User]
    def current_user
      #@current_user ||= Zotero::User.new(self.verify_credentials)
    end
    
  end
end
