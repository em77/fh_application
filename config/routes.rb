Rails.application.routes.draw do

  # For LetsEncrypt verification with sabayon
  if ENV['ACME_KEY'] && ENV['ACME_TOKEN']
    get ".well-known/acme-challenge/#{ ENV["ACME_TOKEN"] }" =>
      proc { [200, {}, [ ENV["ACME_KEY"] ] ] }
  else
    ENV.each do |var, _|
      next unless var.start_with?("ACME_TOKEN_")
      number = var.sub(/ACME_TOKEN_/, '')
      get ".well-known/acme-challenge/#{ ENV["ACME_TOKEN_#{number}"] }" =>
        proc { [200, {}, [ ENV["ACME_KEY_#{number}"] ] ] }
    end
  end

  get 'pages/home'

  resources :apps, only: [:new, :create]

  root to: "pages#home"
end
