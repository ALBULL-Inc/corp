Rails.application.routes.draw do
  root to: "welcome#index"

  resources :recruits
  resources :topics, only: [:index, :show]
  resource :inquiry, only: [:new, :create]

  get '/about_us', to: 'welcome#about_us'
  get '/mission', to: 'welcome#mission'
  get '/policy/childcare', to: 'welcome#policy_childcare'

  namespace :cms do
    root to: "dashboards#index"
    resources :topics
    resources :recruits
  end
end
