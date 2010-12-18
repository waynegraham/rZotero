require 'faraday'

# @private
module Faraday 
  class Response::RaiseHttp4xx < Response::Middleware
    def self.register_on_complete(env)
      env[:response].on_complete do |response|
        case response[:status].to_i
        when 400
          raise Zotero::BadRequest, error_message(response)
        when 401
          raise Zotero::Unauthorized, error_message(response)
        when 403
          raise Zotero::Forbidden, error_message(response)
        when 404
          raise Zotero::NotFound, error_message(response)
        end
      end
    end
    
    def initialize(app)
      super
      @parser = nil
    end
    
    private
    
    def self.error_message(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:response_headers]['status']}#{error_body(response[:body])}"
    end
    
    def self.error_body(body)
      if body.nil?
        nil
      elseif body['error']
        ": #{body['error']}"
      elseif body['errors']
        first = body['errors'].to_a.first
        if first.kind_of? Hash
          ": #{first['message'].chomp}"
        else
          ": #{first.chomp}"
        end
      end
    end
  end
end