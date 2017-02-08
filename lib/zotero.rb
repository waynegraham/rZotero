require 'zotero/version'
require 'yaml'

gem 'oauth', '>= 0.5.1'
require 'oauth'



module Zotero
    @default_site = 'https://api.zotero.org' # Version can be appended here, or passed in by the user

    def self.secret
        YAML.load_file(File.expand_path('zotero/secrets.yml', 'lib'))
    end
    
    def self.consumer_token
        self.secret['consumer_token']
    end
    def self.consumer_secret
        self.secret['consumer_secret']
    end

    # Will create an OAuth Consumer for you.
    #
    # You have to register your application on Zotero.org to get a consumer token and secret.
    #
    # Default provider site is http://api.zotero.org
    def self.consumer(consumer_token, consumer_secret, site = @default_site)
        OAuth::Consumer.new(
            consumer_token,
            consumer_secret,
            site: site,
            request_token_path: '/oauth/request_token',
            access_token_path: '/oauth/access_token',
            authorize_path: '/oauth/authorize'
        )
    end

    def self.register()
    end
end
