Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',
      skip: [:omniauth_callbacks]
      resources :users
      resources :blogs, only: [:index, :create, :update, :destroy] do
      	member do
      		post 'post_comments'
      		get 'get_comments'
      	end
      end
    end
  end
  root 'home#index'
end
