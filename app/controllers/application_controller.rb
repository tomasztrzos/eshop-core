class ApplicationController < ActionController::API
  def index
    render plain: "eshop-core, env: #{Rails.env}"
  end

  def current_user
    return if doorkeeper_token.blank?

    @current_user ||= User.find(doorkeeper_token.resource_owner_id)
  end
end
