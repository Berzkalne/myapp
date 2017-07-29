class AddCalculatedPriceToKinds < ActiveRecord::Migration
  def change
    add_column :kinds, :calculated_price, :decimal
  end
end
