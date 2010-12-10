module Zotero
  # @private
  module Authentication
    private
    
    # Authentication has
    #
    # @return [Hash]
    def authentication 
      {
        :secret_key => secret_key
      }
    end
    
    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      authentication.values.all?
    end
  end
end