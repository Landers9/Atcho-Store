class AddContraintsToCarts < ActiveRecord::Migration[5.2]
  def change
    change_column :carts, :sum_price, :integer, default: 0, null: false
    change_column :carts, :number_product, :integer, default: 1, null: false
  end
end
