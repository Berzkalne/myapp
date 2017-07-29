class FinalPriceCalculator

  def initialize(object)
    @kinds = object.kinds
    @final_price = 0
  end

  def calculates_final_price
    @kinds.each do |kind|
      kind.calculated_price
      kind.cash_turnover_type

      case kind.cash_turnover_type
      when 'income'
        income_calculation(kind.calculated_price)
      when 'expense'
        expense_calculation(kind.calculated_price)
      else
        @final_price
      end
    end
    @final_price
  end

  private

  def income_calculation(price)
    @final_price = @final_price + price
  end

  def expense_calculation(price)
    @final_price = @final_price - price
  end

end
