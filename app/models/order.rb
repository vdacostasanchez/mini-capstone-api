class Order < ApplicationRecord
  belongs_to :user, :product
end
