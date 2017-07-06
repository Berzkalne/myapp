class Subject < ActiveRecord::Base
  belongs_to :school
  belongs_to :unicorn

  validates :subject_name, presence: true, uniqueness: true
  validates :room, presence: true
end
