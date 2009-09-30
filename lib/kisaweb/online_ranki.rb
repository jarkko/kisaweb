module Kisaweb
  class OnlineRanki < Kisaweb::Base
    def self.find(klass)
      res = fetch_class(:klass => klass)
      res_arr = FasterCSV.parse(res.body)
      res_arr.shift
      res_arr.map do |row|
        ListItem.from_array(row)
      end
    end
    
    def self.date
      @@date ||= Date.parse(fetch_date.body)
    end
    
    def self.categories
      @@categories ||= parse_categories(fetch_categories.body)
    end

    private
    
    def self.parse_categories(str)
      str.split("\n").map do |line|
        title, amount = line.split
        Category.new(title, amount)
      end
    end

    define_remote_method :fetch_date,
                         :path => "/ranki/pvm.txt",
                         :cache_responses => 6000
    define_remote_method :fetch_class, :path => "/ranki/:klass.txt"
    define_remote_method :fetch_categories,
                         :path => "/ranki/sarjat.txt",
                         :cache_responses => 6000
  end
end