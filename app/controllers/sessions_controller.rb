class SessionsController < ApplicationController
  def new
    #new sign in form needs to be created 
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id #if user signs in with id of 1 it assigns it to the session.
      flash[:notice] = "Welcome #{user.id}, you are signed in!"
      redirect_to root_path
    else
      flash[:alert] = "Wrong email or password!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil #when the session is destroyed it is empty
    flash[:notice] = "You are Logged out!"
    redirect_to root_path
  end
end
