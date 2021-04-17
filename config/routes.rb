Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  root 'admins/products#index'

  namespace :admins do
    resources :products

    resources :products do
      member do
        delete :delete_image_attachment
      end
    end

    namespace :products do
      post 'csv_upload'
    end
    end
end
