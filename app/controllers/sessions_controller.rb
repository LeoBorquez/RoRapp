class SessionsController < ApplicationController

  layout 'admin'

  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase) #Get email user from database
    if user && user.authenticate(params[:session][:password]) #Get password from database
      log_in user #Method declared in sessions_helper.rb
      redirect_to user #Rails automatically converts this to the route for the user’s profile page:
    else
      flash.now[:danger] = 'Invalid email/password combination' #Disappear after additional request
      render 'new'
    end


  end

  def destroy

  end

end
