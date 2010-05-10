class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def program
    @event = Event.find(params[:id])
    
    if params[:direction]
      case params[:direction]
      when /next/
        @event = @event.next
      when /previous/
        @event = @event.previous
      end
    end
  end

  def results
    @event = Event.find(params[:id])

    if params[:direction]
      case params[:direction]
      when /next/
        @event = @event.next
      when /previous/
        @event = @event.previous
      end
    end

    if ! @event.scored?
      render :action => "program"
      return
    end
  end
end
