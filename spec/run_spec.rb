require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::Run do
  context "new" do
    before(:each) do
      @run = Kisaweb::Run.new("9444", "25.65")
    end
    
    it "should set the contest_id and points" do
      @run.contest_id.should == "9444"
      @run.points.should == BigDecimal.new("25.65")
    end
  end
end