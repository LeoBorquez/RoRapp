class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #including the module into the base class of all controllers

  # Confirms a logged in user
  private def logged_in_user
    unless logged_in?
      store_location # Store the actual location of the user.
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
