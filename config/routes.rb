Rails.application.routes.draw do
  resources :resources do
    resources :comments
  end
end
