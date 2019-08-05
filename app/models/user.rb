class User < ApplicationRecord
  require 'digest'

  before_create :generateToken
  before_save { self.email = email.downcase }

  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  
  has_secure_password
  private def generateToken
    token = SecureRandom.urlsafe_base64
    token = Digest::SHA1.hexdigest(token)
    token = token.to_s
    self.remember_token = token
  end
end
