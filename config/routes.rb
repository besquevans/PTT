Rails.application.routes.draw do
  root "pages#index"

  get '/index', to: "pages#index"
  get '/about', to: "pages#about"

  resources :boards do 
    resources :posts, only: [:index, :new, :create]
  end

  resources :posts, except: [:index, :new, :create]

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
