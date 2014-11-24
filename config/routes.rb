Rails.application.routes.draw do
  mount JasmineRails::Engine => '/jasmine' if defined?(JasmineRails)
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    resource :session, only: [:create, :destroy]
    resources :categories
    resources :users do
      member do
        get :activate
      end
    end
  end

  post  '/logout'                        => 'api/sessions#destroy', as: :logout
  get   '/api/check_if_unique_username'  => 'api/users#check_if_unique'
  get   '/auth/:provider/callback'       => 'api/sessions#oauth', as: :oauth
  post  '/api/users/upload'              => 'api/users#avatar_upload'

end

