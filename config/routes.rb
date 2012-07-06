TM::Application.routes.draw do

  devise_for :admins

  root to: 'tm_open#index'

  resources :tm_open, only: [:index]
  resources :rules, only: [:index]
  resources :contact, only: [:index]
  resources :help, only: [:index]
  resources :admins, only: [:index]

  resources :registers

  resources :qualifications do
    get :edit_week_1, on: :collection
    get :edit_week_2, on: :collection
    get :edit_week_3, on: :collection
    get :edit_week_4, on: :collection
    put :update_week_1, on: :collection
    put :update_week_2, on: :collection
    put :update_week_3, on: :collection
    put :update_week_4, on: :collection
  end

  resources :competitions, only: [:index] do
    get :generate_competition, on: :collection
    get :first, on: :collection
    get :second, on: :collection
    get :third, on: :collection
    get :quarterfinal, on: :collection
    get :semifinal, on: :collection
    get :final, on: :collection
    get :edit_first, on: :member
    get :edit_second, on: :member
    get :edit_third, on: :member
    get :edit_quarterfinal, on: :member
    get :edit_semifinal, on: :member
    get :edit_final, on: :member
    put :update_first, on: :member
    put :update_second, on: :member
    put :update_third, on: :member
    put :update_quarterfinal, on: :member
    put :update_semifinal, on: :member
    put :update_final, on: :member
  end



  #, only: [:index, :show, :new, :create]

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
