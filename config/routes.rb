Rails.application.routes.draw do

  resources :informations
  resources :information_comments

  root :to => "informations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
