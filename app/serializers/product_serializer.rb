class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand_name, :product_images
  def product_images
    object.product_images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true) if object.product_images.attached?
    end
  end
end
