Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  resources :products
  root 'products#index'

  resources :products do
    member do
      delete :delete_image_attachment
    end
  end

  namespace :products do
    post 'csv_upload'
  end
end
