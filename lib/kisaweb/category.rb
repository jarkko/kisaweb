module Kisaweb
  class Category
    attr_accessor :title, :amount
    
    def initialize(title, amount)
      self.title, self.amount = title, amount.to_i
    end
  end
end