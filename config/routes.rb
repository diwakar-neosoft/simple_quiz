# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users
  namespace :admin do
    resources :users
    resources :questions
    resources :subjects do
      # get 'questions',on: :member
    end
    resources :exams
  end
  get :admin, to: 'admin/subjects#index'
end
