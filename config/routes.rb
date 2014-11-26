Rails.application.routes.draw do
  mount JasmineRails::Engine => '/jasmine' if defined?(JasmineRails)
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    resource :session, only: [:create, :destroy]
    resources :categories
    resources :food
    resources :drinks
    resources :snacks
    resources :orders
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
  post  '/api/food/upload'               => 'api/food#image_upload'
  post  '/api/orders/:id'                => 'api/orders#create'
  post  '/api/order_close'               => 'api/orders#order_close', as: :order_order_close
  get   '/api/order_summary'             => 'api/orders#order_summary', as: :order_order_summary

end
