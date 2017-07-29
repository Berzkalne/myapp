class IncomeCalculater
  def initialize(name, price, percent)
    @name = name
    @price = price
    @percent = percent
  end

  def calculates_total_income
    case @name
    when "Work"
      work_calculation
    when "Gift"
      gift_calculation
    else
      0
    end
  end

  private

  def work_calculation
    @price / @percent
  end

  def gift_calculation
    @price * @percent
  end
end
