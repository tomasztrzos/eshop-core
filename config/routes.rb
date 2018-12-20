Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth'
  root to: 'application#index'

  namespace 'api' do
    namespace 'v1' do
      resources :users, only: %i[show create update]
    end
  end
end
