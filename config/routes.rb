Rails.application.routes.draw do
  devise_for :users
  resources :resources do
    resources :comments
  end
end
