class Blog < ApplicationRecord
  belongs_to :user
  has_many :likes
  mount_base64_uploader :image, ImageUploader

  acts_as_commentable
end
