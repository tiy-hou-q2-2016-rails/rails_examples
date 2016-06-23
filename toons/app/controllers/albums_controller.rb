class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order("play_count desc")
  end

  def show
    @album = Album.find_by id: params[:id]
  end

  def new
    @album = Album.new
    @album.artist_id = params[:artist_id]
  end

  def create
    @album = Album.new
    @album.title = params[:album][:title]
    @album.artist_id = params[:album][:artist_id]
    if @album.save
      redirect_to artist_path(id: @album.artist_id), notice: "Album Created!"
    else
      render :new
    end
  end

  def play
    @album = Album.find_by id: params[:id]
    @album.play_count += 1
    @album.save

  end
end
