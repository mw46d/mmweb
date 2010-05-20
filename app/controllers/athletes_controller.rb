class AthletesController < ApplicationController
  before_filter :set_team

  def index
    @athletes = Athlete.find(:all, :conditions => cond, :order => "Last_name, First_name, Initial")
  end

  def show
    @athlete = Athlete.find(params[:id])

    if params[:direction]
      case params[:direction]
      when /next/
        @athlete = @athlete.next(:conditions => cond)
      when /previous/
        @athlete = @athlete.previous(:conditions => cond)
      end
    end
    render
  end

  private

  def set_team
    @team = nil

    @team = Team.find(params[:team_id]) if params[:team_id]
  end

  def cond
    { :Team_no => @team.Team_no } if @team
  end
end
