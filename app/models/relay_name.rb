class RelayName < ActiveRecord::Base
  self.table_name = "RelayNames"

  belongs_to :athlete, :class_name => "Athlete", :foreign_key => "Ath_no"
  belongs_to :event, :class_name => "Event", :foreign_key => "Event_ptr"
  belongs_to :relay, :class_name => "Relay", :foreign_key => "Relay_no"
  belongs_to :team, :class_name => "Team", :foreign_key => "Team_no"
end
