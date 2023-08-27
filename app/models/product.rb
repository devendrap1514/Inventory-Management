class Product < ApplicationRecord
  belongs_to :vendor
  has_many :product_variants, dependent: :destroy

  validates :name, :brand_name, presence: true
end
