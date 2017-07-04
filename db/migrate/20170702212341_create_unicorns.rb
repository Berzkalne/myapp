class CreateUnicorns < ActiveRecord::Migration
  def change
    create_table :unicorns do |t|
    	t.string :first_name
    	t.integer :age
    	t.float :horn_length
    	t.string :color
    	t.float :height
    	t.float :weight
    end
  end
end
