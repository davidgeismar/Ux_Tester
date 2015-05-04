Rails.application.routes.draw do

match "/auth/:provider/callback" => "sessions#create", via: :all
match "/signout" => "sessions#destroy", :as => :signout, via: :all

 resources :projects do
  resources :slides, on: :member
 end

 resources :answers

end