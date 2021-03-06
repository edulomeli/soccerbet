Rails.application.routes.draw do
  
  devise_for :users, controllers: {
                                    omniauth_callbacks: "omniauth_callbacks",
                                    sessions: "sessions",
                                    registrations: "registrations",
                                    passwords: "passwords"
                                  }
  
  # Facebook notifications callbacks
  post 'notifications', to: 'user_predictions#index'
  
  # Static pages
  get 'pages/rules'
  post 'pages/rules', to: 'pages#agree_rules'

  resources :game_results
  resources :user_predictions
  resources :games do
    get 'predictions'
  end
  resources :team_groups
  resources :teams
  resources :pools
    
  get 'leaderboards', to: 'pools#leaderboards'
  get 'stats', to: 'pools#stats'
  
  get 'participants', to: 'participants#index'
  get 'participants/:user_id', to: 'participants#show', as: 'show_participant'
  
  # OmniAuth
  get 'login', to: 'sessions#login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user_predictions#index'

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
