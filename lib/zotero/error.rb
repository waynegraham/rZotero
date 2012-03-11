module Zotero
  # Custom error class for rescuing from all Zotero errors
  class Error < StandardError
    attr_reader :http_headers

    # Initialize a new Error object
    #
    # @param message [String]
    # @param http_headers [Hash]
    # @return [Zotero::Error]
    def initialize(message, http_headers)
      @http_headers = Hash[http_headers]
      super(message)
    end
  end
end
