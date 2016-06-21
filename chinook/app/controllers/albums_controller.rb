class AlbumsController < ApplicationController
  
  def index
    @albums = ActiveRecord::Base.connection.execute "select * from Album order by Title asc"
  end
end
