class Kinship < ActiveRecord::Base
  has_many :unicorns
  belongs_to :color

  validates :name, presence: true, uniqueness: true
end
