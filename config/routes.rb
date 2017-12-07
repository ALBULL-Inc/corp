Rails.application.routes.draw do
  root to: "welcome#index"

  get '/about_us', to: 'welcome#about_us'
  get '/mission', to: 'welcome#mission'
  get '/policy/childcare', to: 'welcome#policy_childcare'
  get '/policy/privacy', to: 'welcome#policy_privacy'
  get '/terms', to: 'welcome#terms'

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
  resources :places, only: [:index, :show] do
    resources :photos, only: [:index]
    resource :session, only: [], controller: 'places/sessions', path: "" do
      get   :new,     path: 'login',  as: "new"
      post  :create,  path: 'login'
      match :destroy, path: 'logout', as: "destroy", via: :delete
    end
  end

  # cms routings
  namespace :cms do
    root to: "dashboards#index"
    resources :topics
    resources :recruits
    resources :organizations
    resources :places
    resources :children
    resources :accounts, only: [:index, :show, :edit, :update]
  end
end
