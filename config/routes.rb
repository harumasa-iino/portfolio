Rails.application.routes.draw do
  root "home#index"
  resources :rooms, only: %i[new create show edit update destroy]
end
