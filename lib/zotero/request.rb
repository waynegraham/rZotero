module Zotero
  # Defines HTTP request methods
  module Request
    
    # Perform an HTTP GET request
    def get(path, options={}, raw = false)
      request(:get, path, options, raw)
    end
    
    private
    
    # perform an HTTP request
    def request(method, path, options, raw = false)
      response = connection(raw).send(method) do |request|
        case method
        when :get
          request.url(formatted_path(path), options)
        end
      end
      raw ? response : response.body
    end
    
    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
end