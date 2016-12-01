Rails.application.routes.draw do
  get 'welcome/Index'

  root to: 'welcome#index'
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        
      end
    end
  end
end
