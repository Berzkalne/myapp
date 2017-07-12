class AddPetIdToUnicorns < ActiveRecord::Migration
  def change
    add_column :unicorns, :pet_id, :integer
  end
end
