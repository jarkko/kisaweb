module Kisaweb
  class Runner
    attr_accessor :first_name, :last_name, :club, :license_number

    def initialize(*args)
      self.last_name, self.first_name, self.club, self.license_number = *args
    end
  end
end