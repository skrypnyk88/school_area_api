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
    resources :health_reports

    resources :presence_reports, only: [:index] do
      resources :report_times
    end

    resources :bottle_reports, only: [:index] do
      resources :bottles
    end

    resources :nap_reports, only: [:index] do
      resources :report_times
    end

    resource :our_day, only: [:show, :update]
  end
end
