class Functional < ActiveRecord::Base
  belongs_to :position
  attr_accessible :indicator, :importance, :value, :f_position
end
