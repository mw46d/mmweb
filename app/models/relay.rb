class Relay < EntryBase
  self.table_name = "Relay"
  self.primary_key = "Relay_no"
  
  belongs_to :team, :class_name => "Team", :foreign_key => "Team_no"
  has_many :relay_names, :class_name => "RelayName", :foreign_key => "Relay_no", :order => "Pos_no"
end
