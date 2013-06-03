class Methodrelation < ActiveRecord::Base
  belongs_to :position
  attr_accessible :indicator, :importance, :value, :m_position
end
