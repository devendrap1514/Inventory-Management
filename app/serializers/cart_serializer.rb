class CartSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :product_variant
  belongs_to :customer
end
