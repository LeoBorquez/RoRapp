class SessionsController < ApplicationController

  layout 'admin'

  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase) #Get email user from database
    if user && user.authenticate(params[:session][:password]) #Get password from database

    else
      flash.now[:danger] = 'Invalid email/password combination' #Disappear after additional request
      render 'new'
    end


  end

  def destroy

  end

end
