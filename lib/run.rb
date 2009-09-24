module Kisaweb
  class Run
    attr_accessor :contest_id, :points

    def initialize(contest_id, points)
      self.contest_id = contest_id
      self.points = BigDecimal.new(points)
    end
  end
end