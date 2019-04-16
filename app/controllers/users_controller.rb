class UsersController < ApplicationController

  layout 'admin'
  before_action :logged_in_user, only: [:edit, :update] #restrict the filter to act only on :edit, :update

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #Handle a successful update.
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
