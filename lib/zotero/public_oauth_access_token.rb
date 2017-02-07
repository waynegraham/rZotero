module Zotero

  # Subclass to force API users to pass a consumer key with each request.
  class PublicOAuthAccessToken < OAuthActiveResource::FakeOAuthAccessToken

    attr_accessor :token, :secret
    def initialize(key)
      @key    = key
      @token = "public #{key}"
      @secret = 'Anonymous'

      # ensure that keys are symbols
      @options = @@default_options
    end
    def request(http_method, path, token = nil, request_options = {}, *arguments)
      # Force a relative path from an absolute path
      if path !~ /^\//
        @http = create_http(path)
      end
      _uri = URI.parse(path)

      # Append the consumer key to the request
      if _uri.query.nil?
        _uri.query = "consumer_key=#{@key}"
      else
        _uri.query += "&consumer_key=#{@key}"
      end

      path = "#{_uri.path}#{_uri.query ? "?#{_uri.query}" : ""}"
      rsp = http.request(create_http_request(http_method, path, token, request_options, *arguments ))

      rsp
    end
  end
end
