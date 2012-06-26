Chat::Application.routes.draw do
  get "general/index"

  root to: "general#index"

  match '/auth/:provider/callback', to: 'sessions#callback'
  match '/auth/failure', to: "sessions#failure"
  match '/signin(/:provider)' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
end
