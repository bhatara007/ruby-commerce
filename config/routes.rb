Rails.application.routes.draw do
  resources :orders
  resources :categories
  resources :home
  devise_for :admins
  root 'home#index'



  namespace :admins do
    resources :products

    resources :products do
      match '/create_order' => 'products#create_order', via: [:get, :post]
      match '/order_list' => 'products#order_list', via: [:get, :post]
    end

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
