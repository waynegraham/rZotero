require 'helper'

describe Zotero do

  after do
    Zotero.reset
  end

  context "when delegating a client" do

    describe '.respond_to?' do
      it "should take an optional argument" do
        Zotero.respond_to?(:new, true).should be_true
      end
    end

    describe '.new' do
      it "should return a Zotero::Client" do
        Zotero.new.should be_a Zotero::Client
      end
    end

    describe ".adapter" do
      it "should return the default adapter" do
        Zotero.adapter.should == Zotero::Config::DEFAULT_ADAPTER
      end
    end

    describe ".adapter=" do
      it "should set the adapter" do
        Zotero.adapter = :typhoeus
        Zotero.adapter.should == :typhoeus
      end
    end

    describe ".endpoint" do
      it "should return the default endpoint" do
        Zotero.endpoint.should == Zotero::Config::DEFAULT_ENDPOINT
      end
    end

    describe ".endpoint=" do
      it "should set the endpoint" do
        Zotero.endpoint = "http://www.scholarslab.org"
        Zotero.endpoint.should == "http://www.scholarslab.org"
      end
    end

    describe ".useragent" do
      it "should use the default user agent" do
        Zotero.user_agent.should == Zotero::Config::DEFAULT_USER_AGENT
      end
    end

    describe ".useragent=" do
      it "should set the user agent" do
        Zotero.user_agent = 'Custom User Agent'
        Zotero.user_agent.should == 'Custom User Agent'
      end
    end

    describe ".configure" do
      Zotero::Config::VALID_OPTIONS_KEYS.each do |key|
        it "should set the #{key}" do
          Zotero.configure do |config|
            config.send("#{key}=", key)
            Zotero.send(key).should == key
          end
        end
      end
    end
  end
end
