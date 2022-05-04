Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  get 'user/:id', to: 'users#show', as: 'user'
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :toucs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "toucs#index"
  devise_scope :user do
    get "users", to: 'devise/session#new'
  end
end
