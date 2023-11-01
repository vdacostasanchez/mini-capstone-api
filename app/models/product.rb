class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }
  validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i,
                                  :message => "must have a valid file type", multiline: true

  belongs_to :supplier

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
