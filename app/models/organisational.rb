class Organisational < ActiveRecord::Base
  belongs_to :position
  attr_accessible :importance, :indicator, :extension, :value, :english, :spanish, :french,
                  :place
end
