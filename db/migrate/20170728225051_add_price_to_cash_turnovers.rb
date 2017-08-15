class AddPriceToCashTurnovers < ActiveRecord::Migration
  def change
    add_column :cash_turnovers, :price, :decimal
  end
end
