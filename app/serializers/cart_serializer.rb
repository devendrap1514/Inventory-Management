class CartSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  belongs_to :product_variant
  belongs_to :customer
end
