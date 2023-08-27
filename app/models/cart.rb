class Cart < ApplicationRecord
  belongs_to :product_variant
  belongs_to :customer

  validates :quantity, numericality: { in: (1..100) }
end
