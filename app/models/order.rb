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

    self.subtotal = subtotal_amount
    self.tax = tax_amount
    self.total = total_amount
    self.save
  end
end
