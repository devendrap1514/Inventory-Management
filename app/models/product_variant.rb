class ProductVariant < ApplicationRecord
  belongs_to :product

  validates :product_id, uniqueness: { scope: [:width, :length], message: "Product has already been taken with this width and length"}

  validates :length, :width, presence: true, numericality: { greater_than: 0 }
end
