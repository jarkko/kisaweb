module Kisaweb
  class Run
    attr_accessor :contest_id, :points

    def initialize(contest_id, points)
      self.contest_id = contest_id
      self.points = BigDecimal.new(points)
    end
    
    def contest
      @contest ||= Kisaweb::Contest.find(contest_id)
    end
  end
end