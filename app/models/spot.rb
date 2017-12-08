class Spot < ApplicationRecord
  belongs_to :day
  has_many :photos
end
