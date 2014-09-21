Rails.application.routes.draw do

  devise_for :admins, only: [:sign_in, :sign_out, :session], controllers: {
      sessions: "admins/sessions",
      registrations: "admins/registrations"
    }

  devise_scope :admin do
    get 'admins/edit' => 'admins/registrations#edit', as: 'edit_admin_registration'
    patch 'admins' => 'admins/registrations#update'
    put 'admins' => 'admins/registrations#update'
  end

  namespace :admin do
    resources :achievements
    resources :admins, :except => [:edit, :update]
    resources :exhibitions
    resources :groups
    resources :notifications
    resources :users, :except => [:new, :edit, :create, :update]
    get '/' => 'home#dashboard'
  end

  namespace :api, defaults: { format: :json } do
    resources :exhibitions, only: [:index, :show]
    resources :achievements, only: [:index]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
