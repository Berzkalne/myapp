class CreateCashTurnovernoversKinds < ActiveRecord::Migration
  def change
    create_table :cash_turnovers_kinds, id: false do |t|
      t.integer :cash_turnover_id, index: true
      t.integer :kind_id, index: true
    end
  end
end
