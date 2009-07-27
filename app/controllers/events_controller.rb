class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def program
    @event = Event.find(params[:id])
  end

  def results
    @event = Event.find(params[:id])

    if ! @event.scored?
      render :action => "program"
      return
    end
  end
end
