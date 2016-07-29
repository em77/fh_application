Rails.application.routes.draw do
  get 'pages/home'

  resources :apps, only: [:new, :create]

  root to: "pages#home"
end
