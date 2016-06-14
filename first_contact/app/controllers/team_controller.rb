class TeamController < ApplicationController

  def list
    @team = fetch_team
  end

  def detail
    @team = fetch_team

    @person = @team.find {|person| person.parameterize == params[:id]}

    # handle if there is no person
    render_404 if @person.nil?
  end

  def fetch_team
    team = []
    team << "Jesse Wolgamott"
    team << "Matt Keas"
    team << "Brian Dorton"
    return team
  end
end
