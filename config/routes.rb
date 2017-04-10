Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :my_day_reports, shallow: true
      resources :bottle_reports, param: :day, only: [:index, :show] do
      resources :bottles, shallow: true
    end
    delete '/bottle_reports/:id', to: 'bottle_reports#destroy', as: 'destroy'
      resources :bottle_reports, only: [:index] do
        resources :bottles, shallow: true
      end
    end
  end
end
