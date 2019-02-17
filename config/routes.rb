Rails.application.routes.draw do
  root to: "welcome#index"

  get '/policy/privacy', to: 'welcome#policy_privacy'
  get '/terms', to: 'welcome#terms'
  get '/law', to: 'welcome#law'

  # routings
  devise_for :accounts, path: '',
    path_names: {sign_in: :login, sign_out: :logout},
    controllers: {
      omniauth_callbacks: 'callbacks/omniauth',
      registrations: 'devise_ext/registrations',
      confirmations: 'devise_ext/confirmations',
      passwords:     'devise_ext/passwords',
      sessions:      'devise_ext/sessions'
    }

  resources :topics, only: [:index, :show]
  resources :blogs

  resource :profile, only: [:show, :edit, :update]
  resources :stores, only: [:index, :show]
  resources :plans, only: [:index, :show] do
    resources :subscriptions, only: [:create, :update]
  end
  resources :payments, only: [] do
    post :charge, on: :collection
  end
  resources :subscriptions, only: [] do
    put :pause,  on: :member
    put :resume, on: :member
  end
  resources :parties, only: [:index, :show]
  resources :dartslive_cards, only: [:new, :edit, :create, :update, :destroy]

  resources :feedbacks, only: [:create]
  resources :recruits do
    resource :entry, only: [:new, :create]
  end
  resource :inquiry, only: [:new, :create]
  resources :menus, only: [:show]


  # cms routings
  namespace :cms do
    root to: "dashboards#index"
    resources :accounts, only: [:index, :show, :edit, :update]
    resources :plans
    resources :stores
    resources :recruits
    resources :parties
    resources :topics
    resources :blogs
    resources :menus
  end
end
