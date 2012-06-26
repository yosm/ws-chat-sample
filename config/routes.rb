Chat::Application.routes.draw do
  root to: "general#index"

  match "/auth/:provider/callback" => "sessions#callback"
  match '/signout' => 'sessions#destroy', :as => :signout
end
