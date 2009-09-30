require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::OnlineRanki do
  describe "date" do
    before(:each) do
      resp = stub(:typhoeus_response, :body => "29.9.2009\n")
      Kisaweb::OnlineRanki.should_receive(:fetch_date).
        and_return(resp)
    end
    
    it "should return correct date" do
      Kisaweb::OnlineRanki.date.should == Date.new(2009,9,29)
    end
  end
  
  describe "categories" do
    before(:each) do
      body = "D16 255\nD18 166\nD20 151\nD21 745\nD35 200\nD40 233\nD45 215\nD50 168\nD55 171\nD60 140\nD65 74\nD70 38\nH16 279\nH18 213\nH20 172\nH21 1264\nH35 397\nH40 478\nH45 530\nH50 460\nH55 496\nH60 537\nH65 379\nH70 266\nH75 135\nH80 45\nD75 16\nH85 8\n"
      resp = stub(:typhoeus_response, :body => body)
      Kisaweb::OnlineRanki.should_receive(:fetch_categories).
        and_return(resp)
      @cats = Kisaweb::OnlineRanki.categories
    end
    
    it "should create a list of 28 items" do
      @cats.size.should == 28
    end
    
    it "should create a list of Category objects" do
      @cats.first.title.should == "D16"
      @cats.first.amount.should == 255
    end
  end
end