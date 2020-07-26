Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :users

  namespace :admin do
    resources :pages do
      resources :sections
    end
  end

  namespace :api do
    resources :sections, only: %i[show]
  end

  resources :pages, only: %i[show index]
end
