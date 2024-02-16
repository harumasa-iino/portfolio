# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :rooms, only: %i[new create show edit update destroy]

  resources :contacts, only: %i[new create] do
    collection do
      post 'confirm'
      post 'back'
      get 'done'
    end
  end
end
