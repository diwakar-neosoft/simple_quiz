# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    resources :subjects
  end
  get :admin, to: 'admin/subjects#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
