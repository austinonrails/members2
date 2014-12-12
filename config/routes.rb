Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, path: 'members'
end
