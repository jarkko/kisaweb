module Kisaweb
  class ListItem
    attr_accessor :runner, :position, :points, :runs

    def self.from_array(arr)
      item = new
      item.position = arr.first.to_i
      item.points = BigDecimal.new(arr.last)
      item.runner = Runner.new(*arr[1, 4])
      item.runs = []

      5.step(13, 2) do |i|
        next unless arr[i]

        item.runs << Run.new(arr[i], arr[i + 1])
      end

      item
    end
  end
end