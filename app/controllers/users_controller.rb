# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :no_authentication, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new recieve_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully registered.\nWelcome to the gym, #{@user.name}!"
      redirect_to root_path
    else
      render :new
      flash[:warning] = "You have not successfully registered.\nWelcome to the gym, #{@user.name}!"
    end
  end

  private

  def recieve_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
