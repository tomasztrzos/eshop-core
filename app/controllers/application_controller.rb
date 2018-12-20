class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def index
    render plain: "eshop-core, env: #{Rails.env}"
  end

  private

  def current_user
    return if doorkeeper_token.blank?

    @current_user ||= User.find(doorkeeper_token.resource_owner_id)
  end
end
