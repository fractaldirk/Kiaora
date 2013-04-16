class Position < ActiveRecord::Base
  has_many :responsibilities
  has_many :conditions
  has_many :attitudes
  # competency profile models
  has_many :functionals
  has_many :methodrelations
  has_many :leaderships
  has_many :socials

  attr_accessible :job_title, :responsibilities_attributes, :conditions_attributes,
                  :functionals_attributes, :methodrelations_attributes, :leaderships_attributes,
                  :socials_attributes, :attitudes_attributes, :office, :scope,
                  :valid_from, :job_grade, :reports_to, :line_manages, :purpose, :draft, :user_name
  accepts_nested_attributes_for :responsibilities, allow_destroy: true
  accepts_nested_attributes_for :conditions, allow_destroy: true
  accepts_nested_attributes_for :attitudes, allow_destroy: true
  # competency profile models
  accepts_nested_attributes_for :functionals, allow_destroy: true
  accepts_nested_attributes_for :methodrelations, allow_destroy: true
  accepts_nested_attributes_for :leaderships, allow_destroy: true
  accepts_nested_attributes_for :socials, allow_destroy: true

  amoeba do
    enable
  end

  def office_name
    if office == 1
      "Belgium"
    elsif office == 99
      "Sample JD"
    else
      "To be defined"
    end
  end
end
