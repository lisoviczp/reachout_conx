Rails.application.routes.draw do
  root to: "home#index"
  resources :landlords
  resources :tenants
  resources :buildings
  resources :apartments
  resources :notices

  devise_for :tenants
  devise_for :landlords
  
  # get 'home/index'

  # get 'notices/index'

  # get 'notices/show'

  # get 'notices/new'

  # get 'notices/edit'

  # get 'apartments/index'

  # get 'apartments/show'

  # get 'apartments/new'

  # get 'apartments/edit'

  # get 'buildings/index'

  # get 'buildings/show'

  # get 'buildings/new'

  # get 'buildings/edit'
  
  # get 'tenants/index'

  # get 'tenants/show'

  # get 'tenants/new'

  # get 'tenants/edit'

  # get 'landlords/index'

  # get 'landlords/show'

  # get 'landlords/new'

  # get 'landlords/edit'

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
