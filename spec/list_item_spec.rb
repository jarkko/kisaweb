require File.dirname(__FILE__) + '/spec_helper'

describe ListItem do
  context "from_array" do
    before(:each) do
      @arr = ["189", "Paavola", "Niko",
              "HimU", "1223", "9444",
              "35.65", "9568", "28.61",
              nil, nil, nil, nil, nil, nil,
              "70"]
      @item = ListItem.from_array(@arr)
    end
    
    it "should create runner with correct details" do
      @item.runner.first_name.should == "Niko"
      @item.runner.last_name.should == "Paavola"
      @item.runner.club.should == "HimU"
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
      @item = ListItem.from_array(@arr)
      @item.runs.map{|i| [i.contest_id, i.points]}.should ==
        [["9444", BigDecimal.new("35.65")],
         ["9568", BigDecimal.new("28.61")]]
    end
  end
end