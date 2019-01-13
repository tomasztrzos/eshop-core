class Api::V1::Admin::UsersController < Api::V1::Admin::BaseController
  before_action :doorkeeper_authorize!

  def index
    load_users

    json_response(@users)
  end

  def show
    load_user
    
    json_response(@user)
  end

  def update
    load_user

    @user.update!(user_params)
    json_response(@user)
  end

  def destroy
    load_user

    @user.destroy!
    json_response({}, :no_content)
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def load_users
    @users = User.all
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
