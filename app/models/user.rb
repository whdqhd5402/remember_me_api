class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # validates :email, uniqueness: true # unique key로 만드는 방법

  has_many :trips
  has_secure_password

end
