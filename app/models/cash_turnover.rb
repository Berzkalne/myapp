class CashTurnover < ActiveRecord::Base
  has_and_belongs_to_many :kinds

  def set_price()
    calculator = FinalPriceCalculator.new(self)
    self.price = calculator.calculates_final_price
  end
end
