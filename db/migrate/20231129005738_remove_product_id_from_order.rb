class RemoveProductIdFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :product_id
  end
end
