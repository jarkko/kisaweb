require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::Club do
  describe "from_csv_array" do
    before(:each) do
      @arr = ["AOK", "Akilles OK", "FSO", "http://www.akilles.fi/aok/info.html", "peter.tallberg@foobar.fi", "Peter Tallberg", nil, nil, "110", " "]
      @club = Kisaweb::Club.from_csv_array(@arr)
    end
    
    it "should set club abbreviation correctly" do
      @club.abbreviation.should == "AOK"
    end

    it "should set club name correctly" do
      @club.name.should == "Akilles OK"
    end
    
    it "should set club area correctly" do
      @club.area.should == "FSO"
    end
    
    it "should set club url correctly" do
      @club.url.should == "http://www.akilles.fi/aok/info.html"
    end
    
    it "should set club contact email correctly" do
      @club.contact_email.should == "peter.tallberg@foobar.fi"
    end
    
    it "should set club reference number correctly" do
      @club.reference_number.should == "110"
    end
  end
  
  describe "all" do
    before(:each) do
      clubs_filename = File.dirname(__FILE__) + "/fixtures/clubs.txt"
      body = File.read(clubs_filename)
      resp = mock(:typhoeus_response, :body => body)
      
      Kisaweb::Club.should_receive(:fetch_all).
                    and_return(resp)
      @clubs = Kisaweb::Club.all
    end
    
    it "should fetch and build clubs" do
      @clubs.first.abbreviation.should == "AOK"
    end
  end
  
  describe "find" do
    context "correctly" do
      before(:each) do
        @club = Kisaweb::Club.find("ÄäSa")
      end
      
      it "should find correct club" do
        @club.name.should == "Äänekosken Sarjakuvaseura"
      end
    end
    
    context "with incorrect case" do
      before(:each) do
        @club = Kisaweb::Club.find("tP")
      end
      
      it "should find correct club" do
        @club.name.should == "Tampereen Pyrintö"
      end
    end
  end
end