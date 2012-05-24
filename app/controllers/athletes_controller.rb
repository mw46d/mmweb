class AthletesController < ApplicationController
  before_filter :set_team

  def index
    pp = (params && params[:small]) ? 15 : 2000
    @athletes = Athlete.where(cond).paginate(:page => params[:page], :per_page => pp)
  end

  def show
    @athlete = Athlete.find(params[:id])

    if params[:direction]
      case params[:direction]
      when /next/
        a = @athlete.next(:conditions => cond)
	@athlete = a unless a.blank?
      when /previous/
        a = @athlete.previous(:conditions => cond)
	@athlete = a unless a.blank?
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
