class Kind < ActiveRecord::Base
  has_and_belongs_to_many :cash_turnovers

  validates :name, presence: true
  validates :price, presence: true
  validates :percent, presence: true
  validates :cash_turnover_type, presence: true

  def kinds_height
    price/2
  end

  def define_calculated_price(name, price, percent)
    calculator = "#{cash_turnover_type}_calculator".classify.constantize.new(name, price, percent)
    result = calculator.send "calculates_total_#{cash_turnover_type}".to_sym

    self.calculated_price = result
  end
end
