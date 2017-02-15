class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_album, only: [:user_photos]
  skip_before_action :authenticate_user!, only: [:user_photos]
  #before_action :set_album, only: [:index]

  # GET /photos
  # GET /photos.json
  def index
    if params[:album_id].present?
      @album = Album.find(params[:album_id])
      @album_id = @album.id
      @photos = @album.photos
    else
      @photos = current_user.photos
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    if params[:album_id].present?
      @album_id = params[:album_id]
    else
      @albums = current_user.albums
    end
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      @album_id = @photo.album_id
      if @photo.save
        format.html { redirect_to photos_path(album_id: @photo.album_id), notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_photos
    @photos = current_user.photos
    p "**** photos = #{@photos.inspect}"
  end

  def user_photos
    @photos = @album.photos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end


    def set_album
      p "i am from set_album and id i GET = #{params[:album_id]}"
      @album = Album.find(params[:album_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:tag_line, :image, :album_id)
    end
end
