class Functional < ActiveRecord::Base
  belongs_to :position
  attr_accessible :indicator, :importance, :value
end
