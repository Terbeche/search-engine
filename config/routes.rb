Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root 'searches#index'
  resources :searches, only: [:create, :index]
end
