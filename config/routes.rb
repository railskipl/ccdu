Ccdu::Application.routes.draw do


  resources :survey_reports do
    get 'accept',:on => :member
    get 'reject',:on => :member
    post 'reason_for_reject' , :on => :member
  end
  
  resources :laboratory_reports do
    get 'district',:on => :collection
    get 'zonal_reports',:on => :collection
    get 'zone_accept', :on => :collection
    get 'zone_reject', :on => :collection
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

  resources :mis_reports do 
    get 'block_mis_report', :on => :collection 
    get 'search_block_mis_report', :on => :collection
    get 'district_mis_report', :on => :collection
    get 'search_district_mis_report', :on => :collection
    get 'zone_mis_report', :on => :collection
    get 'search_zone_mis_report', :on => :collection
  end
  

  resources :complaints do 
    get 'invoice_submit', :on => :member
    get 'complaint_district', :on => :collection
  end

  resources :priorities
  
  resources :invoices do 
    get 'payment',:on => :collection
    get 'outstanding',:on => :collection
    get 'district_invoice', :on => :collection 
    get 'approve_invoice', :on => :member
    get 'zone_invoice', :on => :collection
    post 'sample_code_count' , :on => :collection
    get 'submit_invoice', :on => :member
    get 'reject_invoice', :on => :member
    post 'remarks_for_rejection', :on => :member
    get 'district_invoice_show', :on => :member
    get 'zone_invoice_show', :on => :member
  end
  

  resources :water_source_types

  resources :mobile_devices do 
    get 'activate_mobile', :on => :member
    get 'deactivate_mobile', :on => :member
    post 'remarks_for_deactivate', :on => :member
  end
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
    get 'accept_user', :on => :member
    get 'reject_user', :on => :member
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
