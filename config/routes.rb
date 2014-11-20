require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :search, only: [:show]
  resources :landings, only: [:index]

  constraints Monban::Constraints::SignedIn.new do
    root "users#show", as: :profile
  end

  constraints Monban::Constraints::SignedOut.new do
    root "landings#show"
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
end
