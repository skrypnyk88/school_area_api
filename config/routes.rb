Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :my_day_reports, shallow: true
    end

    resources :students do
      put :upload, on: :member
    end

    resources :presence_reports
    resources :report_times

    resources :bottle_reports, only: [:index] do
      resources :bottles
    end

    resources :teachers
  end
end
