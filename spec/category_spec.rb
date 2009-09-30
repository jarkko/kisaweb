require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::Category do
  context "new" do
    before(:each) do
      @cat = Kisaweb::Category.new("H21", "1264")
    end
    
    it "should set the attributes correctly" do
      @cat.title.should == "H21"
      @cat.amount.should == 1264
    end
  end
end