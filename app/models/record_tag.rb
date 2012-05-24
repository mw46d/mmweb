class RecordTag < ActiveRecord::Base
  self.table_name = "RecordTags"
  self.primary_key = "tag_ptr"

  has_many :records, :class_name => "Record", :foreign_key => "tag_ptr"
end
