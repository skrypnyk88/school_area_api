Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'
<<<<<<< 4c2c86725e9454e52a38e519030d76f860dc676a

=======
  
>>>>>>> LVRUBYM-219: change report time controller
  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :my_day_reports, shallow: true
      resources :presence_reports do
        resources :report_times
      end
    end
  end
end
