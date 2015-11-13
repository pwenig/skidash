Rails.application.routes.draw do
  root to: "mountains#new"

  resources :mountains

end
