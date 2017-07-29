class Kind < ActiveRecord::Base
  has_and_belongs_to_many :cash_turnovers

  validates :name, presence: true
  validates :price, presence: true
  validates :percent, presence: true
  validates :cash_turnover_type, presence: true

  def define_calculated_price(name, price, percent)
    if cash_turnover_type == 'expense'
      calculator = ExpenseCalculator.new(name, price, percent)
      result = calculator.calculates_total_expense
    else
      calculator = IncomeCalculator.new(name, price, percent)
      result = calculator.calculates_total_income
    end

    self.calculated_price = result
  end
end