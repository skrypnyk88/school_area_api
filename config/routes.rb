Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :my_day_reports, shallow: true
    end
    resources :presence_reports
    resources :report_times
    resources :bottle_reports, only: [:index] do
      resources :bottles
    end
  end
end
