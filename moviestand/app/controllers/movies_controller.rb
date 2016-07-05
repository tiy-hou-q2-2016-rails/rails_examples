class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by id: params[:id]
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new
    @movie.title = params[:movie][:title]
    @movie.year = params[:movie][:year]
    if @movie.save
      redirect_to movie_path(id: @movie.id)
    else
      render :new
    end
  end
end
