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
    
    describe "contest" do
      context "when @contest is nil" do
        it "should fetch contest by the contest_id" do
          Kisaweb::Contest.should_receive(:find).with("9444").and_return(:contest)
          @run.contest.should == :contest
        end
      end
      
      context "when @contest is set" do
        before(:each) do
          @run.instance_variable_set("@contest", :contest)
        end
        
        it "should use the memoized contest" do
          Kisaweb::Contest.should_not_receive(:find)
          @run.contest.should == :contest
        end
      end
    end
  end
end