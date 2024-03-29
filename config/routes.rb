Rails.application.routes.draw do

  # TODO: あとで消す必要があるかも
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admins, only: [:sign_in, :sign_out, :session], controllers: {
      sessions: "admins/sessions",
      registrations: "admins/registrations"
    }

  devise_scope :admin do
    get 'admins/edit' => 'admins/registrations#edit', as: 'edit_admin_registration'
    patch 'admins' => 'admins/registrations#update', as: 'admin_registration'
    put 'admins' => 'admins/registrations#update'
  end

  namespace :admin do
    resources :achievements
    resources :admins, :except => [:edit, :update]
    resources :bounds do
      resources :beacons
    end
    resources :exhibitions
    resources :groups
    resources :notifications
    resources :treasures
    resources :users, :except => [:new, :edit, :create, :update]
    get '/' => 'home#dashboard'
  end

  namespace :api, defaults: { format: :json } do
    resources :achievements, only: [:index]
    resources :beacons, only: [:index]
    resources :bounds, only: [:index] do
      member do
        post 'check_in'
      end
    end
    resources :exhibitions, only: [:index, :show] do
      member do
        post 'vote'
      end
    end
    resources :notifications, only: [:index]
    resources :statuses, only: [:index, :create, :destroy] do
      member do
        post 'favorites' => 'statuses#fav'
        delete 'favorites' => 'statuses#unfav'
      end
    end
    resources :treasures, only: [:index, :show] do
      member do
        post 'take'
      end
    end
    resources :users, only: [:show, :create]
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
