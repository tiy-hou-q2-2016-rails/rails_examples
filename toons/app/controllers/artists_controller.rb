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

    @artists = Artist.all # select * from artists
    @artists = Artist.where name: "Nirvana" # select * from artists where name = 'Nirvana'
    Artist.count # select count(*) from artists
    @artists = Artist.all # select * from artists

  end

  def show
    # results = ActiveRecord::Base.connection.execute "select * from artists where id = #{params[:id]}"
    # result = results.first
    # @artist = Artist.new
    # @artist.id = result["id"]
    # @artist.name = result["name"]

    # @artist = Artist.where(id: params[:id]).first

    @artist = Artist.find_by id: params[:id]
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new
    @artist.name = params[:artist][:name] # gets what user typed in for name
    if @artist.save # checks .valid? first
      redirect_to artists_path
    else
      render :new
    end


  end
end
