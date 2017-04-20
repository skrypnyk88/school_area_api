Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_scope :user do
    post 'password/forgot', to: 'passwords#forgot'
    post 'password/reset', to: 'passwords#reset'
  end

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

    resources :teachers do
      put :upload, on: :member
    end
  end
end
