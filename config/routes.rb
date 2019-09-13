Rails.application.routes.draw do
  root 'home#index'
  resources :posts
  resources :topics
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # get('/home', to: 'home#index')
  # get 'logout', to: 'users#destroy', as: 'logout'
  # get 'users/destroy'
  # get('/login', to: 'users#login')
  post('/authenticate', to: 'users#authenticate')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'html', to: 'topics#html'
  get 'javascript', to: 'topics#javascript'
  get 'css', to: 'topics#css'


end
