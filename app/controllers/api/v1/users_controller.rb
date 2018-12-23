# TODO: Change name of controller to something related with current_user

class Api::V1::UsersController < ApplicationController
  before_action :doorkeeper_authorize!, except: [:create]

  def show
    json_response(current_user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    load_user

    @user.update!(user_params)
    json_response(@user)
  end

  private

  def load_user
    @user = current_user
  end

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