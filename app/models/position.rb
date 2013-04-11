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
                  :socials_attributes, :attitudes_attributes
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
end
