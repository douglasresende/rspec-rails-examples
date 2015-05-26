Rails.application.routes.draw do

  root to: "pages#index"
  get "share" => "pages#share"

  resources :invited_users, only: [:new, :create]

  devise_for :users, only: [:registrations, :sessions, :confirmations, :unlocks, :passwords]

  resources :subscriptions, only: [:new, :create] do
    get :pending, on: :collection
  end

  get "subscriptions/:confirmation_token/confirm" => "subscriptions#confirm", as: :confirm_subscription

end
