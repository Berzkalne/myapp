class Pet < ActiveRecord::Base
  belongs_to :unicorn

  validates :name, presence: true, uniqueness: true
  validates :eye_color, presence: true
  validates :favourite_food, presence: true
end
