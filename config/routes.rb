Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :banners
    resources :admin_users

    root to: "users#index"
  end

  resources :banners
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
