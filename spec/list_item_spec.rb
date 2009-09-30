require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::ListItem do
  before(:all) do
    clubs_filename = File.dirname(__FILE__) + "/fixtures/clubs.txt"
    body = File.read(clubs_filename)
    resp = mock(:typhoeus_response, :body => body)
    
    Kisaweb::Club.stub(:fetch_all).
                  and_return(resp)
  end
  
  context "from_array" do
    before(:each) do
      @arr = ["189", "Paavola", "Niko",
              "HimU", "1223", "9444",
              "35.65", "9568", "28.61",
              nil, nil, nil, nil, nil, nil,
              "70"]
      @item = Kisaweb::ListItem.from_array(@arr)
    end
    
    it "should create runner with correct details" do
      @item.runner.first_name.should == "Niko"
      @item.runner.last_name.should == "Paavola"
      @item.runner.club.abbreviation.should == "HimU"
      @item.runner.license_number.should == "1223"
    end
    
    it "should set position correctly" do
      @item.position.should == 189
    end
    
    it "should set points correctly" do
      @item.points.should == BigDecimal.new("70")
      @item.points.to_i.should == 70
    end
    
    it "should create runs correctly" do
      @item = Kisaweb::ListItem.from_array(@arr)
      @item.runs.map{|i| [i.contest_id, i.points]}.should ==
        [["9444", BigDecimal.new("35.65")],
         ["9568", BigDecimal.new("28.61")]]
    end
  end
end