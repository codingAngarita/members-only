module SessionsHelper

  def sign_in(user)
    token = generate_token
    user.remember_token = token
    puts token
    cookies.signed.permanent[:remember_token] = token
    puts cookies.signed.permanent[:remember_token]
    puts User.find(1).remember_token
    puts User.find_by(remember_token: cookies.signed.permanent[:remember_token])
  end

  def set_current_user(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.signed.permanent[:remember_token])
  end

  def sign_out
    @current_user = nil
    cookies.signed.permanent.delete :remember_token
  end

 private 
  def generate_token
    token = SecureRandom.urlsafe_base64
    token = token.to_s
  end 
end
