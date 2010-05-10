class AthletesController < ApplicationController
  def index
    cond = nil
    @team = nil

    if params[:team_id]
      cond = {:Team_no => params[:team_id]}
      @team = Team.find(params[:team_id])
    end

    @athletes = Athlete.find(:all, :conditions => cond, :order => "Last_name, First_name, Initial")
  end

  def show
    @athlete = Athlete.find(params[:id])

    if params[:direction]
      case params[:direction]
      when /next/
        @athlete = @athlete.next(:conditions => {:Team_no => @athlete.Team_no})
      when /previous/
        @athlete = @athlete.previous(:conditions => {:Team_no => @athlete.Team_no})
      end
    end
  end
end
