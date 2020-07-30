Rails.application.routes.draw do
  root "boards#index"

  get '/about', to: "pages#about"

  resources :boards do 
    resources :posts, only: [:index, :new, :create]
  end

  resources :posts, except: [:index, :new, :create]
end
