class ApplicationController < ActionController::Base
  def login
    cookies.permanent[:remember_token] = generateToken
  end

  private def generateToken
    token = SecureRandom.urlsafe_base64
    token = Digest::SHA1.hexdigest(token)
    token = token.to_s
  end
end
