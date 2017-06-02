Rails.application.routes.draw do
  resources :banners
  devise_for :users
  root to: 'static#homepage'
end
