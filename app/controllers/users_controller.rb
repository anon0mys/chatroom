class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:succes] = "Your account was created successfully"
      redirect_to chatroom_path
    else
      flash[:error] = "Your account was not created"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
