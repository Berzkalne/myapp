class RemoveColorFromUnicorns < ActiveRecord::Migration
  def change
  	remove_column :unicorns, :color
  end
end
