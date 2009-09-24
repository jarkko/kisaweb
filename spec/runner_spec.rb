require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::Runner do
  context "new" do
    before(:each) do
      @runner = Kisaweb::Runner.new("last", "first", "club", "12345")
    end
    
    it "should set the attributes correctly" do
      @runner.first_name.should == "first"
      @runner.last_name.should == "last"
    end
  end
end