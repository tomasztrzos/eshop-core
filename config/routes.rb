Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth'
  root to: 'application#index'

  namespace 'api' do
    namespace 'v1' do
      resources :users, only: %i[show create update]
      resources :products
      resources :carts_products
      resources :orders, only: %i[show create update]

      namespace 'admin' do
        resources :users
        resources :products
        resources :orders
      end
    end
  end
end
