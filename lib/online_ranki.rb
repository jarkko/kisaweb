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

    define_remote_method :fetch_class, :path => "/ranki/:klass.txt"
  end
end