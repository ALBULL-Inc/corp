Rails.application.routes.draw do
  root to: "welcome#index"

  get '/about_us', to: 'welcome#about_us'
  get '/mission', to: 'welcome#mission'
  get '/policy/childcare', to: 'welcome#policy_childcare'

  # concerns
  concern :inquirable do
    resource :inquiry, only: [:new]
  end

  # routings
  devise_for :accounts, path: '',
    path_names: {sign_in: :login, sign_out: :logout},
    controllers: {
      omniauth_callbacks: 'callbacks/omniauth',
#      registrations: 'devise_ext/registrations',
#      confirmations: 'devise_ext/confirmations',
#      sessions:      'devise_ext/sessions'
    }
  resource :profile, only: [:show, :edit, :update]
  resources :recruits do
    resource :entry, only: [:new, :create]
  end
  resources :topics, only: [:index, :show]
  resource :inquiry, only: [:new, :create]
  resources :places, only: [:index, :show]

  # cms routings
  namespace :cms do
    root to: "dashboards#index"
    resources :topics
    resources :recruits
    resources :organizations
    resources :places
  end
end
