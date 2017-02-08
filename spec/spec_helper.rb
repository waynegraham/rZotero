$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'zotero'

def zotero_site
    'https://api.zotero.org'
end

def zotero_main_site
    'https://www.zotero.org'
end

def zotero_settings
    secret = YAML.load_file(File.expand_path('zotero/secrets.yml', 'lib'))
    {
        access_token: 'spec_test_access_token',
        access_secret: 'spec_test_access_secret',
        consumer_token: secret['consumer_token'],
        consumer_secret: secret['consumer_secret'],
        bad_consumer_token: 'bad_consumer_key',
        bad_consumer_secret: 'bad_consumer_secret'
    }
end

def valid_oauth_access_token
    access_token = zotero_settings[:access_token]
    access_secret = zotero_settings[:access_secret]
    consumer_token = zotero_settings[:consumer_token]
    consumer_secret = zotero_settings[:consumer_secret]

    zotero_consumer = Zotero.consumer(consumer_token, consumer_secret, zotero_site)
    return OAuth::AccessToken.new(zotero_consumer, access_token, access_secret)
end
