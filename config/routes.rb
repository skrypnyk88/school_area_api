Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :our_days, shallow: true
      resources :my_day_reports, shallow: true
    end
  end
end
