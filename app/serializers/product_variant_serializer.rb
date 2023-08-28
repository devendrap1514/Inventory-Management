class ProductVariantSerializer < ActiveModel::Serializer
  attributes :id, :length, :width
  belongs_to :product
end
