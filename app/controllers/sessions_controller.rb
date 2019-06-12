class SessionsController < ApplicationController

  #layout 'admin'

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) #Get email user from database
    if user && user.authenticate(params[:session][:password]) #Get password from database
      if user.activated?
        log_in user #Method declared in sessions_helper.rb
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) #[] override param arguments
        redirect_back_or user
        #redirect_to user #Rails automatically converts this to the route for the user’s profile page
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end

    else
      flash.now[:danger] = 'Invalid email/password combination' #Disappear after additional request
      render 'new'
    end

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url # Change to root
  end

end
