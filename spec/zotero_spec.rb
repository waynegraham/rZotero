require File.expand_path('../spec_helper', __FILE__)

describe "Zotero" do
  
 after do
   Zotero.reset
 end
 
 context "when delegating to a client" do
   
   before do
     #stub_get("statuses/user")
   end
   
 end
 
 describe ".client" do
   it "should be a Zotero::Client" do
     Zotero.client.should be_a Zotero::Client
   end
 end
 
 describe  ".adapter" do
   it "should return default adapter" do
     Zotero.adapter.should == Zotero::Configuration::DEFAULT_ADAPTER
   end
 end
 
 describe ".endpoint" do
   it "should return the default endpoint" do
     Zotero.endpoint.should == Zotero::Configuration::DEFAULT_ADAPTER
   end
 end
 
 describe ".format" do
   it "should set the format" do
     Zotero.format.hsould == Zotero::Configuration::DEFAULT_FORMAT
   end
 end
 
 describe ".format=" do
   it "should set the format" do
     Zotero.format = 'xml'
     Zotero.format.should == 'xml'
   end
 end
 
 describe ".user_agent" do
   it "should return the default user agent" do
     Zotero.user_agent.should == Zotero::Configuration::DEFAULT_USER_AGENT
   end
 end
 
 describe ".user_agent=" do
   it "should set the user agent" do
     Zotero.user_agent = 'Custom User Agent'
     Zotero.user_agent.should == 'Custom User Agent'
   end
 end
 
 describe ".configure" do
   
   Zotero::Configuration::VALID_OPTION_KEYS.each do |key|
     
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
 
  
  
end
