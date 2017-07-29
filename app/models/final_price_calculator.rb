class FinalPriceCalculator

  def initialize(cash_turnover_type, calculated_price)
    @cash_turnover_type = cash_turnover_type
    @calculated_price = calculated_price
  end

  final_price = 0

  def calculates_final_price
    case @cash_turnover_type
    when 'income'
      income_calculation
    when 'expense'
      expense_calculation
    else
      final_price
    end
  end

  private

  def income_calculation
    final_price = final_price + @calculated_price
  end

  def expense_calculation
    final_price = final_price - @calculated_price
  end

end
