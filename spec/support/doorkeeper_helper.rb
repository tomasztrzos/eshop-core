module DoorkeeperHelper
  def login_user
    before do
      user = User.first
      users_attributes = { grant_type: 'password', email: user.email, password: 'B7EFU4c6' }
      post '/api/v1/oauth/token', params: users_attributes
      @token = JSON.parse(response.body)['access_token']
    end

    let!(:access_token) { "Bearer #{@token}" }
  end
end
