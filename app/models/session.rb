class Session < ActiveRecord::Base
  set_table_name "Session"
  set_primary_key "Sess_ptr"
  default_scope :order => "Sess_no"

  has_many :sessitems, :class_name => "SessItem", :foreign_key => "Sess_ptr", :order => "Sess_order"

  def course
    case self.Sess_course
    when /L/
      " m"
    when /S/
      " m"
    when /Y/
      " yd"
    else
      " ?"
    end
  end

end
