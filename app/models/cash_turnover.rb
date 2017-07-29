class CashTurnover < ActiveRecord::Base
  has_and_belongs_to_many :kinds

  def set_price(cash_turnover_type, calculated_price)
    calculator = FinalPriceCalculator.new(cash_turnover_type, calculated_price)
    price = calculator.calculates_final_price
    self.price = price
  end
end
