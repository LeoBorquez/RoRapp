class UsersController < ApplicationController

  #layout 'admin'
  before_action :logged_in_user, only: [:index ,:edit, :update, :destroy] #restrict the filter to act only on :edit, :update
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy #only admin can delete (method admin_user)

  def index
    @users = User.paginate(page: params[:page]) #will_paginate method
  end

  def show
    @user = User.find(params[:id])
    # debugger to debug with the console
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email #UserMailer.account_activation(@user).deliver_now
      #log_in @user # log_in method is part of sessions_helper.rb
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url # common convention, redirect to the newly created user's profile
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # handle a successful update.
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  # Before filters

  # Confirms a logged in user
  def logged_in_user
    unless logged_in?
      store_location # store the actual location of the user
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
