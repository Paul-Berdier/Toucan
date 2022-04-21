Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :toucs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "toucs#index"
  resources :posts do
    resources :likes
  end
end
