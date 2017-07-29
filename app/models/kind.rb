class Kind < ActiveRecord::Base
  has_many :cash_tunovers

  validates :name, presence: true
  validates :price, presence: true
  validates :percent, presence: true
  validates :cash_turnover_type, presence: true

  def define_calculated_price(name, price, percent)
    calculator = if name == 'expense'
      ExpensesCalculator.new
    else
      IncomeCalculkator.new
    end

    self.calculated_price = calculator.calculate
  end
end