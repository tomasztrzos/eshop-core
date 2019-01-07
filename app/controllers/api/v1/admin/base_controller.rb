class Api::V1::Admin::BaseController < ApplicationController
  before_action :check_access

  private

  def check_access
    render json: {}, status: :unauthorized unless current_user.has_role?('admin')
  end
end
