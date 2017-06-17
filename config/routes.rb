Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :articles
  resources :users do 
  	resources :projects
  end
  get '/projets', to: 'projects#edito'
  root to: "home#home"
end
