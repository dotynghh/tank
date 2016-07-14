class Admin::BaseController < ApplicationController
  layout "admin"
  before_filter :auth_admin
  
  private

  def auth_admin
    if logged_in?
      logout_user
    end
  end
end
