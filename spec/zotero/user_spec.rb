require 'helper'

describe Zotero::User do

  describe "#==" do
    
    it "should return true when ids and classes are equal" do
      user = Zotero::User.new('id' => 1)
      other = Zotero::User.new('id' => 1)
      (user == other).should be_true
    end

    it "should return false when classes are not equal" do
      user = Zotero::User.new('id' => 1)
      other = Zotero::Client.new('id' => 1)
      (user == other).should be_false
    end
  
    it "should return false when ids are not equal" do
      user = Zotero::User.new('id' => 1)
      other = Zotero::User.new('id' => 2)
      (user == other).should be_false
    end

  end

end
