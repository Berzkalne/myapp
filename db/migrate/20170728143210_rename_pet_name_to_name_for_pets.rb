class RenamePetNameToNameForPets < ActiveRecord::Migration
  def change
    rename_column :pets, :pet_name, :name
  end
end
