class Responsibility < ActiveRecord::Base
  acts_as_list
  belongs_to :position
  attr_accessible :content, :indicator, :r_position
end
