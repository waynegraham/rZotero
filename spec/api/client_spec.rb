require File.expand_path('../../spec_helper', __FILE__)

describe Zotero::Client do
  
  it "should connect using the endpoint configuration" do
    client = Zotero::Client.new
    endpoint = URI.parse(client.api_endpoint)
    connection = client.send(:connection).build_url(nil).to_s
    connection.should == endpoint.to_s
  end
  
end