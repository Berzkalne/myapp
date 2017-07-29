class RemoveKindFromCashTurnovers < ActiveRecord::Migration
  def change
    remove_column :cash_turnovers, :kind
  end
end
