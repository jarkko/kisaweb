module Kisaweb
  class Contest < Kisaweb::Base
    attr_accessor :title, :date, :organizer, :code
    
    def self.find(code)
      all.select do |contest|
        contest.code == code
      end.first
    end
    
    def self.all
      @@all ||= find_all
    end
    
    def self.from_csv_array(arr)
      contest = new
      contest.title = arr[1]
      
      contest.date = parse_date(arr[0])
                        
      contest.organizer = arr.last.strip
      contest.code = parse_code(arr[0])
      
      contest
    end
    
    def attributes
      {
        :title => title,
        :organizer => organizer,
        :code => code,
        :date => date
      }
    end
    
    private
    
    def self.find_all
      res = fetch_all
      res_arr = FasterCSV.parse(res.body)
      res_arr.map do |row|
        Contest.from_csv_array(row)
      end
    end
    
    def self.parse_date(str)
      Date.parse(str.strip.split(" ").last) rescue nil
    end
    
    def self.parse_code(str)
      str.match(/\(\d+\)|\- \d+/)[0].gsub(/[()-]|\s/, "")
    end
    
    define_remote_method :fetch_all, :path => "/ranki/rankilla.txt"
  end 
end