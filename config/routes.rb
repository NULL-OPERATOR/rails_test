Rails.application.routes.draw do

  root to: "resources#index"

  devise_for :users

  resources :resources do
    resources :comments
  end

end
