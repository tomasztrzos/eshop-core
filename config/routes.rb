Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth'
  root to: 'application#index'

  namespace 'api' do
    namespace 'v1' do
      resources :users, only: %i[show create update]
      resources :products, only: %i[index show]
      resources :carts_products
      resources :orders, only: %i[index show create]

      namespace 'admin' do
        resources :users
        resources :products, only: %i[create update destroy]
        resources :orders, only: %i[index show update]
      end
    end
  end
end
