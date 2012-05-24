class Record < ActiveRecord::Base
  self.table_name = "Records"

  belongs_to :record_tag, :class_name => "RecordTag", :foreign_key => "tag_ptr"
end
