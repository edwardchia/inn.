class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name,
                                 :phone_number)
  end

  def authorize_user!
    redirect_to root_path, alert: "Access Denied" unless @user == current_user || current_user.is_admin == true
  end
end
