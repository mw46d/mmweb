class Entry < EntryBase
  self.table_name = "Entry"

  belongs_to :athlete, :class_name => "Athlete", :foreign_key => "Ath_no"
end
