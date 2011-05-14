class Athlete < ActiveRecord::Base
  set_table_name "Athlete"
  set_primary_key "Ath_no"

  belongs_to :team, :class_name => "Team", :foreign_key => "Team_no"
  has_many :entries, :class_name => "Entry", :foreign_key => "Ath_no"
  has_many :relay_names, :class_name => "RelayName", :foreign_key => "Ath_no"

  acts_as_ordered :order => 'Last_name, First_name, Initial'

  def middle
    if self.Initial.blank? || self.Initial == '*'
      ''
    else
      self.Initial
    end
  end
end
