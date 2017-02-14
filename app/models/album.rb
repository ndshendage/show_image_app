class Album < ApplicationRecord
  mount_uploader :cover_photo, CoverPhotoUploader
  has_many :photos
  belongs_to :user
end
