class SessionsController < ApplicationController
    
  def new
  end

  def create
    user = User.find_by_email(params[:user_form][:email])

    puts params
    if user && user.authenticate(params[:user_form][:password])
      puts 'LOGGED IN'
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
