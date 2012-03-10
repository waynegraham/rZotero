require 'helper'

describe Zotero do
  context "when delegating a client" do

    describe '.respond_to?' do
      it "should take an optional argument" do

      end
    end

    describe '.new' do
      it "should return a Zotero::Client" do
        Zotero.new.should.be_a Zotero::Client
      end
    end
  end
end
