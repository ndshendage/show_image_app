class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :album
  before_validation :check_album_size, only: [:create]


  def check_album_size
    photos = self.album.photos.count
    if photos > 25
      errors.add(:total_photos, "in this album are more than 25 add in other album");
    end
  end
end
