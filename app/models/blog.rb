class Blog < ApplicationRecord
  belongs_to :user
  mount_base64_uploader :image, ImageUploader

  acts_as_commentable
end
