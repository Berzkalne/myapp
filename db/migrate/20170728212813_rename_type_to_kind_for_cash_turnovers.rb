class RenameTypeToKindForCashTurnovers < ActiveRecord::Migration
  def change
    rename_column :cash_turnovers, :type, :kind
  end
end
