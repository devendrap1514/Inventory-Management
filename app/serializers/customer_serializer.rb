class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :profile_picture
  def profile_picture
    Rails.application.routes.url_helpers.rails_blob_url(object.profile_picture, only_path: true) if object.profile_picture.attached?
  end
end
