Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
