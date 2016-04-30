Rails.application.routes.draw do

  resources :topics, only: [:index, :show]

  namespace :cms do
    resources :topics
  end

  get '/about_us', to: 'welcome#about_us'
  get '/mission', to: 'welcome#mission'
  get '/vision', to: 'welcome#vision'
  get '/policy/childcare', to: 'welcome#policy_childcare'
  root to: "welcome#index"
end
