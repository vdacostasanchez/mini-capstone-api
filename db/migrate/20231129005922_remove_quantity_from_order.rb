class RemoveQuantityFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :quantity
  end
end
