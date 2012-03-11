require 'helper'

describe Zotero::Client do
  before do
    @keys = Zotero::Config::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do

    before do
      Zotero.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Zotero.reset
    end

    it "should inherit module configuration" do
      api = Zotero::Client.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          :zotero_key => 'ZK',
          :zotero_secret => 'ZS',
          :oauth_token => 'OT',
          :oauth_token_secret => 'OS',
          :adapter => :typhoeus,
          :endpoint => 'http://www.scholarslab.org/',
          :proxy => 'http://wsg4w:sekret@proxy.example.com:8888',
          :search_endpoint => 'http://www.google.com/',
          :user_agent => 'Custom User Agent',
          :connection_options => {:timeout => 10}
        }
      end

      context "during initialization" do
        it "should override module configuration" do
          api = Zotero::Client.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end

      context "after initialization" do
        it "should override module configuration after initialization" do
          api = Zotero::Client.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end

    end
  end

  
end
