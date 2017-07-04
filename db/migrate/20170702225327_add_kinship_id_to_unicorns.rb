class AddKinshipIdToUnicorns < ActiveRecord::Migration
  def change
  	add_column :unicorns, :kinship_id, :integer
  end
end
