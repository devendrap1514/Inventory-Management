class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :customer

  validates :quantity, numericality: { in: (1..100) }
end
