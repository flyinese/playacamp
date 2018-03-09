Rails.application.routes.draw do
  resources :surveys

  resources :tickets

  resources :camp_scores

  get 'password_resets/new'

  get 'login', to: 'sessions#new', as: 'login_form'
  post 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users
  get 'send/:id', to: 'users#send_tickets', as: 'send_user'
  get 'give/:id', to: 'users#give_tickets', as: 'give_user'

  post 'users/csv', to: 'users#import_csv', as: 'import_csv'

  post 'tickets/bulk_update', to: 'tickets#bulk_update', as: 'bulk_update_tickets'

  resources :password_resets

  get 'info', to: 'visitors#info', as: 'info'
  post 'info', to: 'visitors#update_info'
  root to: 'visitors#index'
end
