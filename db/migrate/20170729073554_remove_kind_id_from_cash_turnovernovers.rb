class RemoveKindIdFromCashTurnovernovers < ActiveRecord::Migration
  def change
    remove_column :cash_turnovers, :kind_id, :integer
  end
end
