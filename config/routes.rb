Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',
      skip: [:omniauth_callbacks]
      resources :users
      resources :blogs, only: [:index, :create, :update, :destroy]
    end
  end
  root 'home#index'
end
