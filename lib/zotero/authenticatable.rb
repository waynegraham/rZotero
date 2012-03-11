module Zotero
  module Authenticatable

    # Credentials hash
    #
    # @return [Hash]
    def credentials
      {
        :zotero_key => zotero_key,
        :zotero_secret => zotero_secret,
        :token => oauth_token,
        :token_secret => oauth_token_secret
      }
    end

    # Check if credentials are available
    #
    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end
  end
end
