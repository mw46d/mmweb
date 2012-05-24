class Athlete < ActiveRecord::Base
  self.table_name = "Athlete"
  self.primary_key = "Ath_no"
  default_scope :order => "Last_name, First_name, Initial"

  belongs_to :team, :class_name => "Team", :foreign_key => "Team_no"
  has_many :entries, :class_name => "Entry", :foreign_key => "Ath_no"
  has_many :relay_names, :class_name => "RelayName", :foreign_key => "Ath_no"

  def next(opts = {})
    cond = opts.delete(:conditions)
    id_array = Athlete.select("Ath_no").where(cond)

    id_array.each_index do |i|
      if id_array[i].Ath_no == self.id
	i += 1 if i < id_array.length - 1
	return Athlete.find(id_array[i].Ath_no)
      end
    end
  end

  def previous(opts = {})
    cond = opts.delete(:conditions)
    id_array = Athlete.select("Ath_no").where(cond)

    id_array.each_index do |i|
      if id_array[i].Ath_no == self.id
	i -= 1 if i > 0
	return Athlete.find(id_array[i].Ath_no)
      end
    end
  end

  def middle
    if self.Initial.blank? || self.Initial == '*'
      ''
    else
      self.Initial
    end
  end
end
