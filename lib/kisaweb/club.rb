module Kisaweb
  class Club < Kisaweb::Base
    attr_accessor :abbreviation, :name, :area,
                  :url, :contact_email, :reference_number
                  
    def self.all
      @@all ||= find_all
    end
    
    def self.find(abbr)
      all.select do |club|
        club.abbreviation.to_s.downcase == abbr.downcase
      end.first
    end
    
    def self.from_csv_array(arr)
      club = new
      club.abbreviation = arr[0]
      club.name = arr[1]
      club.area = arr[2]
      club.url = arr[3]
      club.contact_email = arr[4]
      club.reference_number = arr[8]
      club
    end
    
    private
    
    def self.find_all
      res = fetch_all
      res_arr = FasterCSV.parse(res.body)
      res_arr.shift
      res_arr.map do |row|
        from_csv_array(row)
      end
    end
    
    define_remote_method :fetch_all, 
                         :base_uri => "http://kisaweb.ssl.fi/sf",
                         :path => "/list_file?seura=0=1=1=do=12=-=-=txt&tp=1"
  end
end