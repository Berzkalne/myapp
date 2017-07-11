class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.string :eye_color
      t.string :favourite_food
      t.integer :unicorn_id
    end
  end
end
