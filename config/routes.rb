Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :students do
      put :upload, on: :member
    end
    resources :teachers do
      put :upload, on: :member
    end

    resources :groups
    resources :my_day_reports
    resources :presence_reports
    resources :report_times
    resources :health_reports
    resources :bottle_reports, only: [:index] do
      resources :bottles
    end
    get '/our_day/:day', to: 'our_days#show'
    put '/our_day/:day', to: 'our_days#update'
  end
end
