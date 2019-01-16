class UsersController < ApplicationController

  layout false

  def index

  end

  def show
    @user = User.find(params[:id])
    #debugger to debug with the console
  end
end
