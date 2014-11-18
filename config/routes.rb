Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
end
