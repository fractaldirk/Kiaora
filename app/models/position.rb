class Position < ActiveRecord::Base
  has_many :competencies
  has_many :responsibilities
  has_many :conditions
  attr_accessible :job_title, :responsibilities_attributes, :competencies_attributes, :conditions_attributes
  accepts_nested_attributes_for :competencies, allow_destroy: true
  accepts_nested_attributes_for :responsibilities, allow_destroy: true
  accepts_nested_attributes_for :conditions, allow_destroy: true
end
