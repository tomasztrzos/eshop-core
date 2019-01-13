Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth'
  root to: 'application#index'

  namespace 'api' do
    namespace 'v1' do
      get 'users/current_user', to: 'users#show'
      put 'users/current_user', to: 'users#update'
      resources :users, only: %i[create update]
      resources :products, only: %i[index show]
      resources :carts_products
      resources :orders, only: %i[index show create], param: :slug

      namespace 'admin' do
        resources :users
        resources :products, only: %i[create update destroy]
        resources :orders, only: %i[index show update], param: :slug
      end
    end
  end
end
