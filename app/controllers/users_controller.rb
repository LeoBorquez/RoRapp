class UsersController < ApplicationController

  layout 'admin'


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
      log_in @user #log_in method is part of sessions_helper.rb
      flash[:success] = "New admin created"
      redirect_to @user #common convention, redirect to the newly created user's profile
    else
      render 'users/new'
    end


  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
