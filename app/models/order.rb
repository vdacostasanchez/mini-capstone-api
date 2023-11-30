class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def update_total
    subtotal_amount = 0
    carted_products.each do |carted_product|
      subtotal_amount = carted_product.product.price * carted_product.quantity
    end
    tax_amount = subtotal_amount * 0.9
    total_amount = (subtotal_amount + tax_amount)
    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal_amount,
      tax: tax_amount,
      total: total_amount,
    )
    self.
  end
end
