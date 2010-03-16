module Kisaweb
  class OnlineRanki < Kisaweb::Base
    def self.find(klass)
      res = fetch_class(:klass => klass)
      res_arr = FasterCSV.parse(Iconv.iconv('utf-8', 'latin1', res.body).first)
      res_arr.shift
      res_arr.map do |row|
        ListItem.from_array(row)
      end
    end
    
    def self.date
      @@date ||= Date.parse(Iconv.iconv('utf-8', 'latin1', fetch_date.body).first)
    end
    
    def self.categories
      @@categories ||= parse_categories(Iconv.iconv('utf-8', 'latin1', fetch_categories.body).first)
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