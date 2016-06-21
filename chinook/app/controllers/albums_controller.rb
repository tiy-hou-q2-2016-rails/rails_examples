class AlbumsController < ApplicationController

  class Album
    attr_accessor :id, :title, :artist_id, :artist_name

    def initialize(id, title, artist_id)
      @id = id
      @title = title
      @artist_id = artist_id
    end
  end

  def index
    results = ActiveRecord::Base.connection.execute "select * from Album order by Title asc"
    @albums = results.map do |result|
      album = Album.new(result["AlbumId"], result["Title"], result["ArtistId"])
      album
    end
  end

  def show
    album_sql = "
        SELECT *
        FROM Album
        INNER JOIN Artist ON Album.ArtistId = Artist.ArtistID
        WHERE Album.AlbumId = #{params[:id]}
    "

    tracks_sql = "
      SELECT *
      FROM Track
      WHERE Track.AlbumId = #{params[:id]}
    "

    @tracks = ActiveRecord::Base.connection.execute tracks_sql

    # select always return an array
    results = ActiveRecord::Base.connection.execute album_sql
    # get first (and likely only) item in the array
    album_hash = results.first
    
    @album = Album.new(album_hash["AlbumId"], album_hash["Title"], album_hash["ArtistId"])
    @album.artist_name = album_hash["Name"] # because we joined, Name is Artist.Name




  end
end
