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
  resources :stores, only: [:index, :show] do
    resources :parties, only: [:index, :show]
    resources :topics, only: [:index, :show], controller: 'stores/topics'
  end
  resources :menus, only: [:show]
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
  resources :dartslive_cards, only: [:new, :edit, :create, :update, :destroy]

  resources :feedbacks, only: [:create]
  resources :recruits do
    resource :entry, only: [:new, :create]
  end
  resource :inquiry, only: [:new, :create]

  resources :web_push_subscribers, only: [:create]

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
  namespace :intra do
    root to: "dashboards#index"
    resources :organizations do
      resources :workplaces
      resources :staffs do
        resources :stamps, only: [] do
          get '(/:year/:month)', to: 'stamps#index', on: :collection, as: ""
          get '/:ymd', to: 'stamps#show', on: :collection, as: "ymd"
        end
      end
      resources :stamps, only: [:new, :create]
      resources :stamped_eaches, only: [:new, :edit, :create, :update]
    end
    resources :workplaces, only: [] do
      resource :stamper
      resources :staffs, only: [:index]
    end
    resources :stamps, only: [:index]
    resource :stamper
  end
end
