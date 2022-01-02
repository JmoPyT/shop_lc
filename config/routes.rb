Rails.application.routes.draw do
    # Defines the root path route ("/")
    root "shops#index"

    # shops
    resources :shops
end
