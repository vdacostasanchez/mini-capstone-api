class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  # def subtotal
  #   subtotal_amount = quantity.to_i * Product.find(product_id).price
  #   subtotal_amount
  # end

  # def tax
  #   tax_amount = (quantity.to_i * Product.find(product_id).price) * 0.09
  #   tax_amount
  # end

  # def total
  #   subtotal_amount = quantity.to_i * Product.find(product_id).price
  #   tax_amount = (quantity.to_i * Product.find(product_id).price) * 0.09
  #   total_price = tax + subtotal
  #   total_price
  # end
end
