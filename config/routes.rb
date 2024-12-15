Rails.application.routes.draw do
  #get 'pages/index'
  #get "up" => "rails/health#show", as: :rails_health_check
  #root 'pages#index'
  root 'pages#index'
  get '/categories', to: 'categories#index'
  



  get '/services_several/:id', to: 'services#show_id_several'
  resources(:services, only: %i[show index])
end
