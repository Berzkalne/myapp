class School < ActiveRecord::Base
  has_many :unicorns, :through => :subjects
  has_many :subjects

  validates :school_name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
end
