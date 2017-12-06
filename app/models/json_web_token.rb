require 'jwt'
class JsonWebToken
  @@hmac_secret = Rails.application.secrets.hmac_secret

  def self.encode(data)
    JWT.encode data, @@hmac_secret, 'HS256'
  end
  def self.decode(token)
    JWT.decode token, @@hmac_secret, true, { :algorithm => 'HS256' }
  end
end
