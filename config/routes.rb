InfinityScope::Application.routes.draw do
  resources :line_items

  get "page/home"
  get "page/about"
  get "page/contact"
  #map.connect "/glass_store_links/addtoshop", :controller=> 'glass_store_link', :actions => 'addtoshop'
  get "/glass_store_links/addtoshop" => "glass_store_links#addtoshop", :as => 'addtoshop'
#  get 'glasses/:addtoshop/:id'
get "/glasses/addtoshop1/:id" => "glasses#addtoshop1", :as => 'glasses/addtoshop1'
get "/glass_store_links/new2/:glass_id" => 'glass_store_links#new2', :as => 'glass_store_links/new2'
post "/glass_store_links/create/:glass_id/:store_id/:quantity" => "glass_store_links#create", :as => 'glass_store_links/create'
get "/customers/select_glass" => "customers#select_glass", :as=> 'customers/select_glass'
post "/customers/select_glass_to_old_customer" => "customers#select_glass_to_old_customer", :as=> 'customers/select_glass_to_old_customer'
get "/customers/find_customer" => "customers#find_customer", :as=> 'customers/find_customer'
get '/customers/found_customers' => "customers#found_customers", :as => 'customers/found_customers'
get '/customers/today_sales' => "customers#today_sales", :as => 'customers/today_sales'
  resources :empolyees

  resources :stores

  resources :glass_store_links

  resources :glasses
  #, :collection =>{:addtoshop1 => :get}

  resources :customers
  root 'page#home'

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
