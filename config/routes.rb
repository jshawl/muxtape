Rails.application.routes.draw do
  root 'users#index'
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
end
