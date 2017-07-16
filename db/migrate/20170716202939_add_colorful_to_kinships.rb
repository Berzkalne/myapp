class AddColorfulToKinships < ActiveRecord::Migration
  def change
    add_column :kinships, :colorful, :boolean
  end
end
