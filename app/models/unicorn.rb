class Unicorn < ActiveRecord::Base
	belongs_to :kinship

    def full_name
        "#{first_name} #{kinship.try(:name)}"
    end
end