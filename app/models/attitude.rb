class Attitude < ActiveRecord::Base
  belongs_to :position
  attr_accessible :description, :a_position
end
