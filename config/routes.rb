Rails.application.routes.draw do
  resources :apps, only: [:new, :create]
end
