class CreateFutureDreams < ActiveRecord::Migration
  def change
    create_table :future_dreams do |t|
      t.string :name
      t.text :description
      t.integer :unicorn_id
    end
  end
end
