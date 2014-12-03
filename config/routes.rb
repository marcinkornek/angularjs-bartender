Rails.application.routes.draw do
  mount JasmineRails::Engine => '/jasmine' if defined?(JasmineRails)
  root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    resource :session, only: [:create, :destroy]
    resources :categories
    resources :products
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
  post  '/api/products/upload'           => 'api/products#image_upload'
  post  '/api/food/upload'               => 'api/food#image_upload'
  post  '/api/orders/:id'                => 'api/orders#create'
  post  '/api/order_close'               => 'api/orders#order_close', as: :order_order_close
  post  '/api/order_destroy'             => 'api/orders#order_destroy', as: :order_order_destroy
  post  '/api/order_detail_destroy'      => 'api/orders#order_detail_destroy', as: :order_order_detail_destroy
  get   '/api/order_summary'             => 'api/orders#order_summary', as: :order_order_summary
  get   '/api/search_results'            => 'api/products#search_results', as: :products_search_results
  get   '/api/product_names'             => 'api/products#search_product_names'
  get   '/api/recent_bought_products'    => 'api/products#recent_bought_products'

end
