Rails.application.routes.draw do
  get 'session/new'
  #get 'pages/index'
  #get "up" => "rails/health#show", as: :rails_health_check
  #root 'pages#index'
  root 'pages#index'
  get '/categories', to: 'categories#index'
  



  get '/services_several/:id', to: 'services#show_id_several'
  resources(:services, only: %i[show index])
  resources(:users, only: %i[new create])
  resources(:session, only: %i[new create destroy])
  resources(:stars, only: %i[new create])
end
