class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new params.require(:artist).permit(:name, :new_album_name)
    album = Album.new
    album.title = @artist.new_album_name
    album.artist = @artist
    if @artist.save && album.save
      redirect_to artist_path(id: @artist.id)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find_by id: params[:id]
  end
end
