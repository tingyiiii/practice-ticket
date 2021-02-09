Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'

  resource :tickets, only: [:create, :show]
  resource :ticket, path: '/', only: [] do
    get :new, path: '/exchange', as: 'exchange'
  end
end
