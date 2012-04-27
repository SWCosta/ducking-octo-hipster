Filemanager::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  get :about, :to => "home#about"
  #get :users, :to => "users#index"
  resources :users, :only => [:index, :new, :destroy, :edit, :update]
  post "users/new", :to => "users#create", :as => "new_user"

  root :to => "home#index"

  scope "/files" do
    get "/(*dir)/", to: "directories#show", :as => "directory"
  end

  resource :file, :as => "bin"
  resources :directories, :as => "dir", :except => :show

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
#== Route Map
# Generated on 25 Apr 2012 21:32
#
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        registrations#cancel
#        user_registration POST   /users(.:format)               registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       registrations#new
#   edit_user_registration GET    /users/edit(.:format)          registrations#edit
#                          PUT    /users(.:format)               registrations#update
#                          DELETE /users(.:format)               registrations#destroy
#                    about GET    /about(.:format)               home#about
#                    users GET    /users(.:format)               users#index
#                 new_user GET    /users/new(.:format)           users#new
#                     user DELETE /users/:id(.:format)           users#destroy
#                 new_user POST   /users/new(.:format)           users#create
#                     root        /                              home#index
#                directory GET    /files(/*dir)(.:format)        directories#show
#                      bin POST   /file(.:format)                files#create
#                  new_bin GET    /file/new(.:format)            files#new
#                 edit_bin GET    /file/edit(.:format)           files#edit
#                          GET    /file(.:format)                files#show
#                          PUT    /file(.:format)                files#update
#                          DELETE /file(.:format)                files#destroy
#                      dir POST   /directory(.:format)           directories#create
#                  new_dir GET    /directory/new(.:format)       directories#new
#                 edit_dir GET    /directory/edit(.:format)      directories#edit
#                          PUT    /directory(.:format)           directories#update
#                          DELETE /directory(.:format)           directories#destroy
