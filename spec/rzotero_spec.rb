require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RZotero" do
  
  before(:each) do
    @user_id = 43
    @api_key = 'test'
    @zotero = RZotero.new(@user_id, @api_key)
  end
  
  it "should not be valid with a String user_id" do
    @zotero = RZotero.new("43", "test")
    @zotero.rzotero_error.should be_true
    @zotero.should raise_error
  end
  
  it "should not be valid with an Integer api_key" do
    @zotero = RZotero.new("test", 43)
    @zotero.rzotero_error.should be_true
    @zotero.should raise_error 
  end
  
  it "should get the correct key ('test')" do
    @zotero.key.should eql(@api_key)
  end
  
  it "should get the correct user_id ('43')" do
    @zotero.user.should eql(@user_id)
  end
  
  it "shuold get the correct BASE_URL" do
    @zotero.base.should eql('https://api.zotero.org')
  end
  
end
