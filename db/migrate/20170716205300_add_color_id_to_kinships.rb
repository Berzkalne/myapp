class AddColorIdToKinships < ActiveRecord::Migration
  def change
    add_column :kinships, :color_id, :integer
  end
end
