require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::Contest do
  describe "from_csv_array" do
    context "normal lines" do
      before(:each) do
        @line = ["(9399) 12.4.2009 ", "Saaristorastit", " Pargas IF   "]
        @contest = Kisaweb::Contest.from_csv_array(@line)
      end
      
      it "should set title correctly" do
        @contest.title.should == "Saaristorastit"
      end
      
      it "should set the date correctly" do
        @contest.date.should == Date.new(2009,4,12)
      end
      
      it "should set the organizer correctly" do
        @contest.organizer.should == "Pargas IF"
      end
      
      it "should set the code correctly" do
        @contest.code.should == "9399"
      end
    end
    
    context "weirdo lines" do
      before(:each) do
        @line = ["- 9589", "EP am-keskimatka", "RasKu "]
        @contest = Kisaweb::Contest.from_csv_array(@line)
      end
      
      it "should set title correctly" do
        @contest.title.should == "EP am-keskimatka"
      end
      
      it "should set the date correctly" do
        @contest.date.should be_nil
      end
      
      it "should set the organizer correctly" do
        @contest.organizer.should == "RasKu"
      end
      
      it "should set the code correctly" do
        @contest.code.should == "9589"
      end
    end

  end
  
  describe "attributes" do
    before(:each) do
      Date.stub(:new).and_return(:date)
      Date.stub(:parse).and_return(:date)
      @line = ["(9399) 12.4.2009 ", "Saaristorastit", " Pargas IF   "]
      @contest = Kisaweb::Contest.from_csv_array(@line)
    end
    
    it "should return a hash of attributes" do
      @contest.attributes.should == {:code => "9399", :date => Date.new(2009,12,4), 
                                     :title => "Saaristorastit",
                                     :organizer => "Pargas IF"}
    end
  end
end