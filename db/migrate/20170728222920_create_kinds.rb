class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name
      t.decimal :price
      t.decimal :percent
    end
  end
end
