class CashTurnover < ActiveRecord::Base
  has_and_belongs_to_many :kinds

  def set_price
    calculator = FinalPriceCalculator.new(self)
    self.price = calculator.calculates_final_price
  end

  def statistics_height()
    if self.price < 0
      self.price.abs/20
    elsif self.price > 0
      self.price/20 + 150
    else
      self.price = 150
    end
  end

end
