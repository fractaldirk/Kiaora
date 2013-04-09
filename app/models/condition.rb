class Condition < ActiveRecord::Base
  belongs_to :position
  attr_accessible :environment
end
