Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  resources :products
  root 'products#index'

  namespace :products do
    post 'csv_upload'
  end
end
