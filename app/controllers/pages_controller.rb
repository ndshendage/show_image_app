class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home_page
    @last_photos = Photo.order(id: :desc).limit(25);
  end
end
