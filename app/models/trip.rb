class Trip < ApplicationRecord
  belongs_to :user
  has_many :days
  # defualt paginates_per 25
  paginates_per 10
end
