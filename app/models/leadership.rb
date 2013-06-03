class Leadership < ActiveRecord::Base
  belongs_to :position
  attr_accessible :indicator, :importance, :value, :l_position
end
