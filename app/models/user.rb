class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # validates :email, uniqueness: true # unique key로 만드는 방법

  has_many :trips
  has_secure_password

  def self.hmac_secret
    hmac_secret = 'ccad3cb540896710d8357863052b63acbe02c4facacd88ea5667143f816abd2ccd9ae4d31090040bc9703027d352f72247095c1fd779bbb2259b0fadcb61b0df'
  end
end
