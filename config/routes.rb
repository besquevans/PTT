Rails.application.routes.draw do
  root "boards#index"

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
      delete :sign_out
    end
  end
end
