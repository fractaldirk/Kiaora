class Social < ActiveRecord::Base
  belongs_to :position
  attr_accessible :indicator, :importance, :value, :s_position
end
