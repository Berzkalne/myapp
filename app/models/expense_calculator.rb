class ExpenseCalculator

  def initialize(name, price, percent)
    @name = name
    @price = price
    @percent = percent
  end

  def calculates_total_expense
    case @name
    when "Water"
      water_calculation
    when "Food"
      food_calculation
    when "Electricity"
      electricity_calculation
    when "Heat"
      heat_calculation
    else
      0
    end
  end

  private

  def water_calculation
    @price / @percent
  end

  def food_calculation
    @price - @percent
  end

  def electricity_calculation
    @price * @percent
  end

  def heat_calculation
    @price + @percent
  end
end
