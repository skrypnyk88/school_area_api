Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :my_day_reports, shallow: true
    end
  	get '/bottle_reports/:day', to: 'bottle_reports#show'

  	post '/bottle_reports/addbottle', to: 'bottle_reports#create'

  	post '/bottle_reports/updatebottle', to: 'bottle_reports#update'

  	delete '/bottle_reports/removebottle', to: 'bottle_reports#destroy'
  end
end
