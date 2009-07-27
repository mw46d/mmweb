class RecordTag < ActiveRecord::Base
  set_table_name "RecordTags"
  set_primary_key "tag_ptr"

  has_many :records, :class_name => "Record", :foreign_key => "tag_ptr"
end
