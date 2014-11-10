Rails.application.routes.draw do
  root to: "goals#index"
  resources :users, only: [:new, :create, :show] do
    resources :comments, only: [:new, :create]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :goals do
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:destroy]
end
