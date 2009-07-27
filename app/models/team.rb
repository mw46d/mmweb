class Team < ActiveRecord::Base
  set_table_name "Team"
  set_primary_key "Team_no"

  has_many :athletes, :class_name => "Athlete", :order => "Last_name, First_name, Initial", :foreign_key => "Team_no"
  has_many :relays, :class_name => "Relay", :foreign_key => "Team_no"

  def score
    # Do it in the DB rather than Rails.
    unless @score.nil?
      return @score
    end
    
    relay_array = Relay.find_by_sql [ "SELECT SUM(Ev_score) AS score FROM Relay WHERE Team_no = ?", self.id]
    entry_array = Entry.find_by_sql [ "SELECT SUM(Ev_score) AS score FROM Entry, Athlete WHERE Entry.Ath_no = Athlete.Ath_no AND Athlete.Team_no = ?", self.id]
    
    @score = relay_array[0].score.to_f + entry_array[0].score.to_f
  end

  def entries
    # Do it in the DB rather than Rails.
    unless @entries.nil?
      return @entries
    end

    entry_array = Entry.find_by_sql [ "SELECT count(*) AS count FROM Entry, Athlete WHERE Entry.Ath_no = Athlete.Ath_no AND Athlete.Team_no = ?", self.id]

    @entries = entry_array[0].count
  end
end
