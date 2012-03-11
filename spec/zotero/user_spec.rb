require 'helper'

describe Zotero::User do

  describe "#==" do
    it "should return true when ids and classes are equal" do
      user = Zotero::User.new('id' => 1)
      other = Zotero::User.new('id' => 1)
      (user == other).should be_true
    end
  end

end
