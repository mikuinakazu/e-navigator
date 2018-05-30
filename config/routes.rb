Rails.application.routes.draw do
  root 'profiles#index'
  devise_for :users
  resources :users do
    resources :interviews, except: [:show]
  end
  # resources :interviews, except: [:show]
  resources :profiles, only: [:new, :create, :edit, :update]
end
