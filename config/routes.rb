Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, path: 'members'
end
