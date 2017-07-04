class CreateKinships < ActiveRecord::Migration
  def change
    create_table :kinships do |t|
    	t.string :name
    	t.string :color
    	t.text :description
    end
  end
end
