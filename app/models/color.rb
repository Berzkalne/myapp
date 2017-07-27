class Color < ActiveRecord::Base
  has_many :kinships

  def to_s
    name
  end
end
