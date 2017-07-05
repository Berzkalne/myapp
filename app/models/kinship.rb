class Kinship < ActiveRecord::Base
	has_many :unicorns

    validates :name, presence: true, uniqueness: true
    validates :color, presence: true
end