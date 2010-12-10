require 'faraday_middleware'
Dir[File.extend_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Zotero
  # @private
  module Connection
    private
    
    def connection(raw=false)
      options = {
        :headers => {'Accept' => "application/#{format}", 'User-Agent' => user_agent},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => api_endpoint
      }
      
      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::Multipart
        connection.adapter(adapeter)
        connection.use Faraday::Response::RaiseHttp5xx
        
        unless raw
          case format.to_s.downcase
          when 'xml' then connection.use Faraday::Response::ParseXml
          when 'bib' then connection.use Faraday::Response::ParseText
          end
        end
        
        connection.use Faraday::Response::RaiseHttp4xx
        connection.use Faraday::Response::Mashify unless raw
      end
      
    end
  end
end