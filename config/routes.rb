Rails.application.routes.draw do
  root "pages#index"

  get '/index', to: "pages#index"
  get '/about', to: "pages#about"

  #API
  namespace :api do
    namespace :v2 do
      resources :boards, only: [:index]
    end
  end



  #Origin
  resources :favorites, only: [:index]

  resources :boards do 
    resources :posts, shallow: true do 
      resources :comments, shallow: true, only: [:create]
    end
    
    member do
      post :favorite
    end
  end

  # shallow =>
  # resources :boards do 
  #   resources :posts, only: [:index, :new, :create]
  # end
  # resources :posts, except: [:index, :new, :create]

  resources :users, only: [:create] do
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
