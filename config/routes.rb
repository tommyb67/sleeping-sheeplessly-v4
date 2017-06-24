Rails.application.routes.draw do
  resources :banners
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
