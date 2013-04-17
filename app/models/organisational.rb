class Organisational < ActiveRecord::Base
  belongs_to :position
  attr_accessible :importance, :indicator, :value, :english, :spanish, :french
end
