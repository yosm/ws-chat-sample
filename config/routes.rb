Chat::Application.routes.draw do
  get "general/index"

  root to: "general#index"

  match "/auth/:provider/callback" => "sessions#callback"
  match '/signout' => 'sessions#destroy', :as => :signout
end
