class EventsController < ApplicationController
  def index
    pp = (params && params[:small]) ? 15 : 200
    opts = ""
    opts += "Event_stroke = '#{params[:stroke]}'" if params[:stroke]

    if params[:relay]
      opts += " AND " if opts.length > 0
      opts += "Ind_rel = '#{params[:relay]}'"
    end

    if params[:long]
      opts += " AND " if opts.length > 0
      opts += params[:long].to_i == 1 ? "Event_ptr < 50" : "Event_ptr > 50"
    end

    @events = Event.where(opts).paginate(:page => params[:page], :per_page => pp)
  end

  def program
    @event = Event.find(params[:id])

    if params[:direction]
      case params[:direction]
      when /next/
        e = @event.next
	@event = e unless e.blank?
      when /previous/
        e = @event.previous
	@event = e unless e.blank?
      end
    end

    program_entries
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
      program_entries
      render :action => "program"
      return
    end
  end

  private
  def program_entries
    @heat = params[:heat].to_i

    if params[:small] && @heat < 1
      @heat = 1 if @event.max_heat > 0
    end

    @per_page = (params && params[:small]) ? 15 : 200
    @entries = @event.entries({:heat => @heat, :page => params[:page], :per_page => @per_page})
  end
end
