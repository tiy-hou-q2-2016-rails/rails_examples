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
    results = ActiveRecord::Base.connection.execute "
      SELECT *
      FROM Artist
      WHERE ArtistId = #{params[:id]}
    "
    result = results.first
    @artist = Artist.new result["ArtistId"], result["Name"]

  end
end
