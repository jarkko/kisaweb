require File.dirname(__FILE__) + '/spec_helper'

describe Kisaweb::Runner do
  context "new" do
    before(:each) do
      clubs_filename = File.dirname(__FILE__) + "/fixtures/clubs.txt"
      body = File.read(clubs_filename)
      resp = mock(:typhoeus_response, :body => body)
      
      Kisaweb::Club.stub(:fetch_all).
                    and_return(resp)
      @runner = Kisaweb::Runner.new("last", "first", "IkNV", "12345")
    end
    
    it "should set the attributes correctly" do
      @runner.first_name.should == "first"
      @runner.last_name.should == "last"
      
      @runner.club.name.should == "Ikaalisten Nouseva-Voima"
    end
  end
end