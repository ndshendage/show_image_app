class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :album
  before_save :check_album_size


  def check_album_size
    p "**** I am in the before save ***** "
    photos = self.album.photos.count
    p"and count is = #{photos}"
    if photos > 2
      return false
    end
  end
end
