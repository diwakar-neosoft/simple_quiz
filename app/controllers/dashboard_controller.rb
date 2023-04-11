class DashboardController < ApplicationController
  before_action :check_admin
  
  def index
  end

  private

  def check_admin
    if !!current_user && current_user.admin?
      redirect_to admin_subjects_path
    end
  end
end
