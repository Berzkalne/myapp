class RemovePriceFromCashTurnovers < ActiveRecord::Migration
  def change
    remove_column :cash_turnovers, :price
  end
end
