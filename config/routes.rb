Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true

      resources :my_day_reports, shallow: true

      resources :presence_reports do
        resources :report_times
    end
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    resources :presence_reports
    resources :report_times
=======
    resources :presence_reports do
      resources :report_times
=======

>>>>>>> LVRUBYM-219: Fixed
    end
>>>>>>> LVRUBYM-190: User actions on backend
  end
end
