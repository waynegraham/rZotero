require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)
require File.expand_path('../authentication', __FILE__)

module Zotero
  # @private
  class API
    # @ private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    
    # create new api
    def initialize(options = {})
      options = Zotero.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    include Connection
    include Request
    include Authentication
  end
end