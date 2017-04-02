Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
    end
    resources :my_day_reports
  end
end
