class AlbumsController < ApplicationController

  class Album
    attr_accessor :id, :title, :artist_id, :artist_name

    def initialize(id, title, artist_id)
      @id = id
      @title = title
      @artist_id = artist_id
    end

    def track_count
      tracks.count
    end

    def tracks
      # what goes here?

      tracks_sql = "
        SELECT *
        FROM Track
        WHERE Track.AlbumId = #{@id}
      "

      track_results = ActiveRecord::Base.connection.execute tracks_sql
      track_results.map do |hash|
        track = Track.new hash["TrackID"], hash["Name"], hash["AlbumId"]
      end


    end
  end

  class Track
    attr_accessor :id, :album_id, :name

    def initialize(id, name, album_id)
      @id = id
      @name = name
      @album_id = album_id
    end
  end

  def index
    results = ActiveRecord::Base.connection.execute "select * from Album order by Title asc"
    @albums = results.map do |result|
      album = Album.new(result["AlbumId"], result["Title"], result["ArtistId"])
      album
    end
    @albums = @albums.sort_by {|album| album.track_count}.reverse
  end

  def show
    album_sql = "
        SELECT Artist.*, Album.Name as 'ArtistName'
        FROM Album
        INNER JOIN Artist ON Album.ArtistId = Artist.ArtistID
        WHERE Album.AlbumId = #{params[:id]}
    "


    # select always return an array
    results = ActiveRecord::Base.connection.execute album_sql
    # get first (and likely only) item in the array
    album_hash = results.first

    @album = Album.new(album_hash["AlbumId"], album_hash["Title"], album_hash["ArtistId"])
    @album.artist_name = album_hash["ArtistName"]
  end
end
