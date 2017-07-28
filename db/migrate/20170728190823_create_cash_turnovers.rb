class CreateCashTurnovers < ActiveRecord::Migration
  def change
    create_table :cash_turnovers do |t|
      t.string :name
      t.string :state
      t.string :type
      t.decimal :price
      t.integer :priority
      t.text :description

      t.boolean :paid
      t.timestamps
    end
  end
end
