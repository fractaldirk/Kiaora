class Position < ActiveRecord::Base
  has_many :competencies
  attr_accessible :job_title, :competencies_attributes
  accepts_nested_attributes_for :competencies
end
