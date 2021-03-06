Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/users/:id/profile', to: 'users#profile', as: 'profile'

  resources :users do
    resources :favorites, only: [:index]
  end
  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end
end
