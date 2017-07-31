class CashTurnover < ActiveRecord::Base
  has_and_belongs_to_many :kinds

  def set_price
    calculator = FinalPriceCalculator.new(self)
    self.price = calculator.calculates_final_price
  end

  def statistics_height
    price = self.price
    if price < 0
      price.abs/20
    elsif price > 0
      price/20 + 150
    else
      price = 150
    end
  end

end
