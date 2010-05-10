class SessItem < ActiveRecord::Base
  set_table_name "Sessitem"
  default_scope :order => "Sess_order"

  belongs_to :session, :class_name => "Session", :foreign_key => "Sess_ptr"
  belongs_to :event, :class_name => "Event", :foreign_key => "Event_ptr"
end
