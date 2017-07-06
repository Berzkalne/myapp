class Unicorn < ActiveRecord::Base
  belongs_to :kinship

  validates :first_name, presence: true, uniqueness: true
  validates :age, :numericality => { :less_than_or_equal_to => 25 }
  validates :horn_length, :numericality => { :less_than_or_equal_to => 5 }
  validates :height, :numericality => { :less_than_or_equal_to => 3 }
  validates :weight, :numericality => { :less_than_or_equal_to => 200 }
  
  def full_name
    "#{first_name} #{kinship.try(:name)}"
  end
end
