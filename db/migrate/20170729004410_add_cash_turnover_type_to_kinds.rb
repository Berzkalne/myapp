class AddCashTurnoverTypeToKinds < ActiveRecord::Migration
  def change
    add_column :kinds, :cash_turnover_type, :string
  end
end
