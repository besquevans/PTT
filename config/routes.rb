Rails.application.routes.draw do
  root "pages#index"

  get '/index', to: "pages#index"
  get '/about', to: "pages#about"

  resources :favorites, only: [:index]

  resources :boards do 
    resources :posts, only: [:index, :new, :create]
    member do
      post :favorite
    end
  end

  resources :posts, except: [:index, :new, :create] do
    resources :comments, shallow: true, only: [:create]
  end

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
