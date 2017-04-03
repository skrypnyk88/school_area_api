Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :my_day_reports, shallow: true
    end
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    resources :presence_reports
    resources :report_times
=======
    resources :presence_reports do
      resources :report_times
    end
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
