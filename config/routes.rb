Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
<<<<<<< bb76cb055ad2fbb409311893a6359a745590dac6
      resources :my_day_reports, shallow: true
=======
      resources :bottle_reports, param: :day, only: [:index, :show] do
      resources :bottles, shallow: true
    end
    delete '/bottle_reports/:id', to: 'bottle_reports#destroy', as: 'destroy'
>>>>>>> LVRUBYM-221:Added associations to group and student; Changed controllers and added tests for it
    end
  end
end
