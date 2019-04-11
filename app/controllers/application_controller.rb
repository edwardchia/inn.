class ApplicationController < ActionController::Base
  
  private
      # need to make a signed in controller available to all controllers
  def current_user
    if session[:user_id].present? #is this user present?
      @current_user ||= User.find_by(id: session[:user_id]) #find the ID of the user
    end
  end

  helper_method(:current_user)
  # 'helper_method' makes a controller method available
  # to all views (or templates)

  def user_signed_in? #checks if user is signed in
    current_user.present?
  end
  helper_method(:user_signed_in?)

  def authenticate_user! #a redirect if user is not signed in or signed up.
      unless user_signed_in?
          flash[:danger] = "You must sign in or sign up first!"
          redirect_to new_session
      end
  end

end
