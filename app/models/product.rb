class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  def is_discounted?
    if price <= 10
      return true
    else
      return false
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
