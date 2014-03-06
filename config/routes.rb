Ccdu::Application.routes.draw do


  resources :survey_reports do
    get 'accept',:on => :member
    get 'reject',:on => :member
    post 'reason_for_reject' , :on => :member
  end
  
  resources :laboratory_reports do
    get 'district',:on => :collection
    get 'send_for_testing',:on => :member
    get 'update_testing_report',:on => :member
    post 'submit_update_test',:on => :member
    post 'submit_test',:on => :member
    get 'accept',:on => :member
    get 'reject',:on => :member
    post 'reason_for_reject' , :on => :member
    get 'accepted_sample',:on => :collection
    get 'rejected_sample',:on => :collection
    get 'district_accept', :on => :collection
    get 'district_reject', :on => :collection
  end
  
  resources :block_laboratories
  resources :invoices do 
    get 'payment',:on => :collection
    get 'outstanding',:on => :collection
    get 'district_invoice', :on => :collection 
    get 'approve_invoice', :on => :member
  end
  

  #resources :parameters
  resources :mobile_devices
  #resources :mobile_users
  devise_for :users , :controllers => { :sessions => "sessions", :passwords => "passwords"}

  devise_scope :user do
    authenticated :user do
      root :to => 'home#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new'
    end
  end
  match "/users/update_user", :to => "users#update_user"
  
  namespace :admin do 
    match '/dashboard' => "dashboard#index", :as => :root
    resources :users
    resources :habitations
    resources :villages
    resources :grampanchyats
    resources :districts
    resources :zones
    resources :blocks
    resources :sources
  end

  resources :users do
    get 'edit_manager',:on => :member
    post 'update_manager',:on => :member
  end

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
