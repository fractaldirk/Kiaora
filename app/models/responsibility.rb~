class Responsibility < ActiveRecord::Base
  belongs_to :position
  attr_accessible :content, :indicator, :r_position

  validates_length_of :content_length, :maximum => 255

  def content_length
    if false
      errors.add :content, "responsibility too long."
    end
  rescue ArgumentError
    errors.add :content, "is out of range"
  end
end
