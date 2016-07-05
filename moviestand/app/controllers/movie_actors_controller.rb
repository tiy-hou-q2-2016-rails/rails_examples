class MovieActorsController < ApplicationController
  def new
    @movie_actor = MovieActor.new
    @movie_actor.movie_id = params[:movie_id]
    @movie_actor.actor_id = params[:actor_id]
  end

  def create
    @movie_actor = MovieActor.new
    @movie_actor.movie_id = params[:movie_actor][:movie_id]
    @movie_actor.actor_id = params[:movie_actor][:actor_id]
    if @movie_actor.save
      redirect_to movie_path(id: @movie_actor.movie_id)
    else
      render :new
    end
  end
end
