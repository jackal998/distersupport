Rails.application.routes.draw do

  devise_for :users
  # 這邊是建議用nested routes
  # resources :informations do
  #   resources :comments , :controller => "information_comments"
  # end

  resources :informations
  resources :information_comments

  root :to => "informations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
