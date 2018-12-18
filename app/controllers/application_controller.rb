class ApplicationController < ActionController::API
  def index
    render plain: "eshop-core, env: #{Rails.env}"
  end
end
