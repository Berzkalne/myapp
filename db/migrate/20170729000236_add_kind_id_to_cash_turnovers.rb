class AddKindIdToCashTurnovers < ActiveRecord::Migration
  def change
    add_column :cash_turnovers, :kind_id, :integer
  end
end
