class User < ApplicationRecord
  require 'digest'
  
  before_create :generateToken

  has_secure_password
  has_many :posts

  private def generateToken
    token = SecureRandom.urlsafe_base64
    token = Digest::SHA1.hexdigest(token)
    token = token.to_s
    self.remember_token = token
  end
end
