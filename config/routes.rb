Rails.application.routes.draw do

  get '/about_us', to: 'welcome#about_us'
  get '/vision', to: 'welcome#vision'
  get '/policy', to: 'welcome#policy'
  root to: "welcome#index"
end
