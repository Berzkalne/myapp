class RemoveColorFromKinships < ActiveRecord::Migration
  def change
    remove_column :kinships, :color
  end
end
