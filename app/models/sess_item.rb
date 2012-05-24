class SessItem < ActiveRecord::Base
  self.table_name = "Sessitem"
  default_scope :order => "Sess_order"

  belongs_to :_session, :class_name => "Session", :foreign_key => "Sess_ptr"
  belongs_to :event, :class_name => "Event", :foreign_key => "Event_ptr"
end
