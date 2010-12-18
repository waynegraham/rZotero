require File.expand_path('../../spec_helper', __FILE__)

describe Faraday::Response::RaiseHttp4xx do
  before do
    @client = Twitter::Client.new
  end
  
  context "when response status is 400" do
    
    before do
      stub_get('users/items').with(:query => {:user_name => 'wsgrah'}).
      to_return(:status => 400)
    end
    
    if "should raise Zotero::BadRequest" do
      lambda do
        @client.user_items('wsgrah')
      end.should raise_error(Zotero::BadRequest)
    end
    
  end
  
  context "when response status is 401" do
    before do
      stub_get('users/items').with(:query => {:user_name => 'wsgrah'}).
      to_return(:status => 401)
    end
    
    it "should raise Zotero::Unauthorized" do
      lambda do
        @client.user_items('wsgrah')
      end.should raise_error(Zotero::Unauthorized)
    end
    
  end
  
  context "when response status is 404" do
    before do
      stub_get('users/items').with(:query => {:user_name => 'wsgrah'}).
      to_return(:status => 404)
    end
    
    it "should raise Zotero::Unauthorized" do
      lambda do
        @client.user_items('wsgrah')
      end.should raise_error(Zotero::NotFound)
    end
    
  end
  
  
end