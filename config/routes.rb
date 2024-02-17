# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'home#index'
  resources :rooms, only: %i[new create show edit update destroy]

  namespace :admin do
    get '/', to: 'admin#index', as: 'index'
    resources :posters, only: [:new, :create]
  end

  resources :contacts, only: %i[new create] do
    collection do
      post 'confirm'
      post 'back'
      get 'done'
    end
  end
end
