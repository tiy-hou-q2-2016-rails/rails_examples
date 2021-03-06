class ArtistsController < ApplicationController

  def index
    # results = ActiveRecord::Base.connection.execute "select * from artists"
    # @artists = results.map do |result|
    #   # Artist.new id: result["id"], name: result["name"]
      # artist = Artist.new
    #   artist.id = result["id"]
    #   artist.name = result["name"]
    #   artist
    # end

    # @artists = Artist.all # select * from artists
    # @artists = Artist.where name: "Nirvana" # select * from artists where name = 'Nirvana'
    # Artist.count # select count(*) from artists
    @artists = Artist.all # select * from artists

    @most_popular_album = Album.order("play_count desc").limit(1).first

  end

  def show
    # results = ActiveRecord::Base.connection.execute "select * from artists where id = #{params[:id]}"
    # result = results.first
    # @artist = Artist.new
    # @artist.id = result["id"]
    # @artist.name = result["name"]

    # @artist = Artist.where(id: params[:id]).first

    @artist = Artist.find_by id: params[:id]
    # select * from artist where id= 10 limit 1

    # artist has many albums
    # album belongs to artist

    # @albums = Album.where artist_id: params[:id]
    # select * from albums where artist_id = 10
    # @albums = @artist.albums
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new
    @artist.name = params[:artist][:name] # gets what user typed in for name
    if @artist.save # checks .valid? first
      redirect_to artists_path, notice: "Artist Created! Yay! \o/"
    else
      render :new
    end


  end
end
