class AddSchoolIdToUnicorns < ActiveRecord::Migration
  def change
    add_column :unicorns, :school_id, :integer
  end
end
