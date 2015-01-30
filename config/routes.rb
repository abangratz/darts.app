Rails.application.routes.draw do
  root 'home#index'
  resources :players, except: [:edit, :new]
end
