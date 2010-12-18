require 'faraday'

# @private
module Faraday
  class Response::RaiseHttp5xx < Response::Middleware
    def self.register_on_complete(env)
      env[:response].on_complete do |response|
        case response[:status].to_i
        when 500
          raise Zotero::InternalServerError, error_message(response, "Something is technically wrong.")
        when 502
          raise Zotero::BadGateway, error_message(response, "Zotero servers are down or being upgraded.")
        when 503
          raise Zotero::ServiceUnavailable, error_message(response, "Zotero is over capacity.")
        end
      end
    end
  
    def initialize(app) 
      super
      @parser = nil
    end
    
    private
    
    def self.error_message(response, body=nil)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:response_headers]['status']}:#{(' ' + body) if body} Check http://status.twitter.com/ for updates on the status of the Twitter service."
    end
      
  end
end