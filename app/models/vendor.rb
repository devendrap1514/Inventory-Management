class Vendor < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :profile_picture, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: /\A[a-zA-Z0-9]+@[a-zA-Z]+\.com+\z/ }

  before_save :remove_whitespace

  def remove_whitespace
    self.first_name = self.first_name.strip.squeeze(" ")
    self.last_name = self.last_name.strip.squeeze(" ")
    self.email = self.email.gsub(/\s+/, "") # replace all whitespace with nothing
  end
end
