module Kisaweb
  class Runner
    attr_accessor :first_name, :last_name, :club_name, :license_number, :club

    def initialize(*args)
      self.last_name, self.first_name, self.club_name, self.license_number = *args
      self.club = Club.find(club_name)
    end
  end
end