class AddInventoryOfProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :inventory, :integer
  end
end
