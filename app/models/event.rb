class Event < ActiveRecord::Base
  set_table_name "Event"
  set_primary_key "Event_ptr"
  default_scope :order => "Event_no"

  has_many :i_entries, :class_name => "Entry", :foreign_key => "Event_ptr", :order => "Fin_heat, Fin_lane"
  has_many :r_entries, :class_name => "Relay", :foreign_key => "Event_ptr", :order => "Fin_heat, Fin_lane"
  has_one :session_item, :class_name => "SessItem", :foreign_key => "Event_ptr"
  has_one :session, :class_name => "Session", :through => :session_item

  acts_as_ordered :order => 'Event_no'
  
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

  def entries
    if self.relay?
      r_entries
    else
      i_entries
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

  def records
    return @records unless @records.nil?

    @records = Record.find(:all, :order => "Record_Time",
      :conditions => [ "tag_gender = ? AND tag_indrel = ? AND tag_dist = ? AND tag_stroke = ? AND low_age = ? AND high_Age = ?",
      self.Event_gender, self.Ind_rel, self.Event_dist, self.Event_stroke, self.Low_age, self.High_Age])
  end

  def relay?
    self.Ind_rel === 'R'
  end

  def seeded?
    entries.each do |e|
      if !e.Fin_heat.nil? && e.Fin_heat > 0
        return true
      end
    end

    nil
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
end
