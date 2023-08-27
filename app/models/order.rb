class Order < ApplicationRecord
  belongs_to :product_variant
  belongs_to :customer
end
