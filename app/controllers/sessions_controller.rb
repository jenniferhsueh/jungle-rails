class SessionsController < ApplicationController
    
  def new
  end

  def create

    email = params[:user_form][:email]
    password = params[:user_form][:password]

    user = User.authenticate_with_credentials(email, password)

    if user
      session[:user_id] = user.id
      redirect_to '/'
    else 
      redirect_to '/login'
    end

    # user = User.find_by_email(params[:user_form][:email])

    # if user && user.authenticate(params[:user_form][:password])
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    #   redirect_to '/login'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
