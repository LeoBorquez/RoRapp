class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #including the module into the base class of all controllers
end
