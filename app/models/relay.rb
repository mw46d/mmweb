class Relay < EntryBase
  set_table_name "Relay"
  set_primary_key "Relay_no"
  
  belongs_to :team, :class_name => "Team", :foreign_key => "Team_no"
  has_many :relay_names, :class_name => "RelayName", :foreign_key => "Relay_no", :order => "Pos_no"
end
