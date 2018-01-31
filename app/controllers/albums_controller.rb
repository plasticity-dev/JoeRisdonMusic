class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :new, :update]

  def index
    @albums = Album.all
    @collection = Album.orderedCollection
  end

  def show
    @albums = Album.all
    @album = Album.find(params[:id])
  end

  def new
    if params[:artist]
      @album = Album.new(artist: params[:artist])
    else
      @album = Album.new
    end

  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def check_user
      redirect_to root_path  if !user_signed_in?
    end

    def album_params
      params.require(:album).permit(:title, :bc_embed, :track_count, :year, :artist, :bandcamp_link, :artwork_url, :description, :release_date)
    end
end
