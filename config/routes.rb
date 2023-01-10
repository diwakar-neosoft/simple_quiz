# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    resources :subjects
    resources :exams
  end
  get :admin, to: 'admin/subjects#index'
  root 'admin/subjects#index'
end
