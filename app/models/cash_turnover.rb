class CashTurnover < ActiveRecord::Base
  belongs_to :kind

  validates :kind_id, presence: true

  def set_price(name, price, percent)
    income_calculater = IncomeCalculater.new(name, price, percent)
      self.price = income_calculater.calculates_total_income
    expense_calculator = ExpensesCalculater.new(name, price, percent)
      self.price = expense_calculater.calculates_total_expenses
  end
end
