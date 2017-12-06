class Trip < ApplicationRecord
  belongs_to :user

  paginates_per 6
end
