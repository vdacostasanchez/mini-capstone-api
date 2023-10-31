class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { maximum: 500, minimum: 10 }

  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end

  def tax
    tax_amount = price.to_f * (0.09)
    tax_amount
  end

  def total
    tax_amount = price.to_f * (0.09)
    total_price = price + tax_amount
    total_price
  end
end
