MyPortfolio::Application.routes.draw do

  resources :posts


  resources :pictures

  # resource :posts
  #   get '/posts/:post_id/pictures/new', to: 'posts#new_image', as: :new_image
  #   post '/posts/:post_id/pictures/new', to: 'posts#create_image', as: :create_image
  # this is for the post method after it's created to tie the pictures into the controller like a boss. 

  devise_for :installs

  root :to => 'static_pages#home'

  #get "home", to: "static_pages#home", as: :home

  get "projects", to: "static_pages#projects", as: :projects

  get "about", to: "static_pages#about", as: :about

  get "contact", to: "static_pages#contact", as: :contact

  get "posts", to: "posts#index", as: :index

  get "ipsum_generator", to: "static_pages#ipsum_generator", as: :ipsum_generator

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
