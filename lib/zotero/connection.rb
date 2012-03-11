require 'faraday'


module Zotero
  module Connection
    private

    # Returns a Faraday::Conection object
    #
    # @param options [Hash] A has of options
    # @return [Faraday::Connection]
    def connection(options={})
      default_options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => user_agent
        },
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => options.fetch(:endpoint, endpoint)
      }

      @connection ||= Faraday.new(default_options.deep_merge(connection_options)) do |buildier|
        builder.use Zotero::Request::Phoenix

        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.adapter(adapter)
      end
    end
  end

end
