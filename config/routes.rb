# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'home#index'
  resources :rooms, only: %i[new create show edit update destroy]
  resources :questions, only: %i[show]
  resources :answers, only: %i[create index]
  resources :composite_images, only: %i[index show]
  namespace :admin do
    root to: 'dashboards#index'
    resources :posters do
      resources :poster_answers, only: %i[new create edit update] do
        collection do
          get 'edit_multiple'
          patch 'update_multiple'
        end
      end
    end
  end

  resources :contacts, only: %i[new create] do
    collection do
      post 'confirm'
      post 'back'
      get 'done'
    end
  end
end
