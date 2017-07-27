class RenameColors < ActiveRecord::Migration
  def change
    rename_column :colors, :color, :code
  end
end
