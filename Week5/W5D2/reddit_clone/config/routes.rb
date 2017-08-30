Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:new, :create, :edit, :update, :index, :show]

  resources :posts, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create]
  root 'subs#index'
end
