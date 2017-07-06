class Subject < ActiveRecord::Base
  belongs_to :school
  belongs_to :unicorn

  validates :name, presence: true, uniqueness: true
  validates :room, presence: true
end
