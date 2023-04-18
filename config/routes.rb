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

  resources :exam_submissions, only: [ :new, :create ]
  # resources :exam_submission_answers, only: [ :create ]
end
