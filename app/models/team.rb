class Team < ActiveRecord::Base
  self.table_name = "Team"
  self.primary_key = "Team_no"

  has_many :athletes, :class_name => "Athlete",
    :order => "Last_name, First_name, Initial",
    :foreign_key => "Team_no"
  has_many :relays, :class_name => "Relay", :foreign_key => "Team_no"

  def score
    # Do it in the DB rather than Rails.
    unless @score.nil?
      return @score
    end
    
    relay_array = Relay.select("SUM(Ev_score) AS score").where(:Team_no => self.id)
    entry_array = Entry.select("SUM(Ev_score) AS score").joins(:athlete).where("Athlete.Team_no = ?", self.id)
    
    @score = relay_array[0].score.to_f + entry_array[0].score.to_f
  end

  def entries
    # Do it in the DB rather than Rails.
    unless @entries.nil?
      return @entries
    end

    entry_array = Entry.select("count(*) AS count").joins(:athlete).where("Athlete.Team_no = ?", self.id)

    @entries = entry_array[0].count
  end
end
