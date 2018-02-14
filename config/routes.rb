Rails.application.routes.draw do

  root :to => 'main#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  get '/account/edit', :to => 'users#edit'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :analytics, only: [:index]
    namespace :stores, as: :store, path: ':store' do
      resources :items, only: [:index, :new, :create, :edit, :update]
    end
  end

  namespace :stores, as: :store, path: ':store' do
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show]
  end

  resources :stores, only: [:index]

  resources :users, only: [:new, :create, :edit, :update]

  resources :orders, only: [:index, :new, :show, :update]

  resources :dashboard, only: [:index]

  get '/cart', :to => 'carts#index', :as => 'cart'

  resources :items, only: [:index, :show]

  resources :carts, only: [:index, :create, :destroy]

  patch '/cart', :to => 'carts#update'

  delete '/cart', :to => 'carts#destroy'
  resources :carts, only: [:index, :create, :destroy]

  get '/:category', to: 'categories#show', param: :slug, as: "category"

end
