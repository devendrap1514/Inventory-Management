class ProductVariant < ApplicationRecord
  belongs_to :product

  validates :length, :width, presence: true, numericality: { greater_than: 0 }
end
