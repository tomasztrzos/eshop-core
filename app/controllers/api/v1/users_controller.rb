class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :street_address,
      :city,
      :zip_code,
      :country,
      :phone_number,
      :email,
      :password,
      :password_confirmation
    )
  end
end
