class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)

    if user && user.authenticate(password) 
      @user = user
    else
      nil
    end
  end
  # if user && user.authenticate(params[:user_form][:password])
  #   session[:user_id] = user.id
  #   redirect_to '/'
  # else
  #   redirect_to '/login'
  # end
end