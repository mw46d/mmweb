class Event < ActiveRecord::Base
  self.table_name = "Event"
  self.primary_key = "Event_ptr"
  default_scope :order => "Event_no"

  has_many :i_entries, :class_name => "Entry", :foreign_key => "Event_ptr", :order => "Fin_heat, Fin_lane"
  has_many :r_entries, :class_name => "Relay", :foreign_key => "Event_ptr", :order => "Fin_heat, Fin_lane"
  has_one :session_item, :class_name => "SessItem", :foreign_key => "Event_ptr"
  has_one :_session, :class_name => "Session", :through => :session_item

  def next
    Event.where("Event_no > ?", self.Event_no).first
  end

  def previous
    Event.where("Event_no < ?", self.Event_no).last
  end

  def age
    if self.Low_age == 0
      self.High_Age.to_s + " & Under"
    else
      self.Low_age.to_s + " - " + self.High_Age.to_s
    end
  end

  def distance
    self.Event_dist.to_i.to_s + session.course
  end

  def entries(opts ={})
    w_opts = { :Event_ptr => id }

    h =  opts.delete(:heat)

    if !h.blank? && h > 0
      w_opts[:Fin_heat] = h
      order = "Fin_heat, Fin_lane"
    elsif seeded?
      order = "Fin_heat, Fin_lane"
    else
      order = "ActualSeed_time"
    end

    if self.relay?
      klass = Relay
    else
      klass = Entry
    end

    if opts[:per_page]
      klass.where(w_opts).order(order).paginate(opts)
    else
      klass.where(w_opts).order(order)
    end
  end

  def gender
    case self.Event_sex
    when /X/
      "Mixed"
    when /B|M/
      "Boys"
    when /F|G|W/
      "Girls"
    else
      self.Event_sex
    end
  end

  def max_heat
    return @max_heat unless @max_heat.nil?

    r = if self.relay?
	  Relay.select("max(Fin_heat) as max").where("Event_ptr = ?", id)
	else
	  Entry.select("max(Fin_heat) as max").where("Event_ptr = ?", id)
	end
    @max_heat = r[0].max.to_i
  end

  def records
    return @records unless @records.nil?

    @records = Record.where("tag_gender = ? AND tag_indrel = ? AND tag_dist = ? AND tag_stroke = ? AND low_age = ? AND high_Age = ?",
			      self.Event_gender, self.Ind_rel,
			      self.Event_dist, self.Event_stroke,
			      self.Low_age, self.High_Age).order("Record_Time")
  end

  def relay?
    self.Ind_rel === 'R'
  end

  def seeded?
    max_heat > 0
  end

  def scored?
    entries.each do |e|
      if !e.Ev_score.nil? && e.Ev_score > 0
        return true
      end
    end

    nil
  end

  def stroke
    case self.Event_stroke
    when /A/
      "Freestyle" + (relay? ? " Relay" : "")
    when /B/
      "Backstroke"
    when /C/
      "Breaststroke"
    when /D/
      "Butterfly"
    when /E/
      relay? ? "Medley Relay" : "IM"
    else
      "Unknown"
    end
  end

  def self.strokes
    return @strokes unless @strokes.nil?

    s_array = Event.select("Event_stroke, Ind_rel, Event_dist").where("Low_age = 11").uniq

    @strokes = []
    s_array.each do |s|
      name = ''
      case s.Event_stroke
      when /A/
	if s.Ind_rel === 'I'
	  if s.Event_dist == 100
	    long = 1
	    name += "Long "
	  else
	    long = 0
	    name += "Short "
	  end
	end

	name += "Free"
	name += " Relay" if s.Ind_rel === 'R'
      when /B/
	name = "Backstroke"
      when /C/
	name = "Breaststroke"
      when /D/
	name = "Butterfly"
      when /E/
	name = s.Ind_rel === 'R' ? "Medley Relay" : "Individual Medley"
      else
	name = "Unknown"
      end

      sh = { :name => name, :stroke => s.Event_stroke, :relay => s.Ind_rel }
      sh[:long] = long unless long.nil?

      @strokes << sh
    end

    @strokes
  end

  private
  def session
    @_session = Session.first unless @_session
    @_session
  end
end
