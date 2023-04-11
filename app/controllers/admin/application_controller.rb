# frozen_string_literal: true

module Admin
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_admin

    private

    def check_admin
      redirect_to root_path unless current_user.admin?
    end
  end
end
