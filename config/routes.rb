Rails.application.routes.draw do
  devise_for :users
  root 'user_badges#index'
    resources :user_badges, only: [:index, :show] do
      resources :user_objectives, only: [:create]
    end
  resources :badges, only: [:index, :new, :show]
end
