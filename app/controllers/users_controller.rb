class UsersController < ApplicationController

  layout false


  def index

  end

  def show
    @user = User.find(params[:id])
    #debugger to debug with the console
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'users/new'
    end


  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
