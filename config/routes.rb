Rails.application.routes.draw do
  root 'pages#index'

  get '/index', to: 'pages#index'
  get '/about', to: 'pages#about'
  get '/pricing', to: 'pages#pricing'
  get '/payment', to: 'pages#payment'
  post '/checkout', to: 'pages#checkout'

  #API
  namespace :api do
    namespace :v2 do
      resources :boards, only: %i[index]
    end
  end

  #Origin
  resources :favorites, only: %i[index]

  resources :boards do
    resources :posts, shallow: true do
      resources :comments, shallow: true, only: %i[create]
    end

    member do
      post :favorite
      put :hide
    end
  end

  # shallow =>
  # resources :boards do
  #   resources :posts, only: [:index, :new, :create]
  # end
  # resources :posts, except: [:index, :new, :create]

  resources :users, only: %i[create] do
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out
    end
  end
end
