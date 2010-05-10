class Person < ActiveRecord::Base
  belongs_to :category
  acts_as_ordered :order => 'name', :scope => :category
end

class Manager < Person
end
