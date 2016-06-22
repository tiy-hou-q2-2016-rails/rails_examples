class ArtistsController < ApplicationController

  class Artist
    attr_accessor :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end
  end

  def index
    results = ActiveRecord::Base.connection.execute "select * from Artist order by Name asc"
    @artists = results.map do |result|
      artist = Artist.new result["ArtistId"], result["Name"]
      artist
    end
  end

  def show
    @artist = fetch_artist
  end

  def new
  end

  def create

    if params[:name].blank?
      @error_message = "Name needs to be filled out, yo!"
      render :new
    else
      ActiveRecord::Base.connection.execute "
        INSERT INTO Artist
        (Name)
        Values ('#{params[:name]}')
      "
      redirect_to artists_path, notice: 'Artist Created!'
    end


  end

  def edit
    @artist = fetch_artist
  end

  def update
    ActiveRecord::Base.connection.execute "
      UPDATE Artist
      SET name = '#{params[:name]}'
      WHERE ArtistID = #{params[:id]}
    "
    redirect_to artist_path(id: params[:id]), notice: 'Artist Updated!'

  end


  def delete
    ActiveRecord::Base.connection.execute "
      DELETE FROM Artist
      WHERE ArtistID = #{params[:id]}
    "
    redirect_to artists_path, notice: 'Artist Deleted!'

  end


  def fetch_artist
    results = ActiveRecord::Base.connection.execute "
      SELECT *
      FROM Artist
      WHERE ArtistId = #{params[:id]}
    "
    result = results.first
    Artist.new result["ArtistId"], result["Name"]
  end

end
