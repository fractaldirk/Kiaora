class Responsibility < ActiveRecord::Base
  belongs_to :position
  attr_accessible :content, :indicator, :r_position, :i_position, :s_position, :c_position
end
