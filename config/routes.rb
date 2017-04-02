Rails.application.routes.draw do
  post '/signin', to: 'authentication#authenticate'
  get '/refresh_token', to: 'authentication#refresh_token'

  devise_for :user, skip: :sessions

  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
      resources :my_day_reports, shallow: true
<<<<<<< 6b426f725b27b5ae5adb7f602876ca02cc82fe0d
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
      
      resources :presence_reports do
        resources :report_times
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
    end
<<<<<<< 3f32bbaa485f770a2a11f6c172d2e4aed1e17a50
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    resources :presence_reports
    resources :report_times
=======
    resources :presence_reports do
      resources :report_times
=======

>>>>>>> LVRUBYM-219: Fixed
=======
      end
>>>>>>> LVRUBYM-219: add ReportTimesController
    end
>>>>>>> LVRUBYM-190: User actions on backend
=======
    resources :presence_reports do
      resources :report_times
=======

      resources :presence_reports do
        resources :report_times
    end

>>>>>>> LVRUBYM-219: Fixed
=======
      resources :presence_reports do
        resources :report_times
      end
>>>>>>> LVRUBYM-219: add ReportTimesController
    end
<<<<<<< 624920b1a3efa372cbd806fe6010367441c5e6e7
>>>>>>> LVRUBYM-190: User actions on backend
=======
  	get '/bottle_reports/:day', to: 'bottle_reports#show'

  	post '/bottle_reports/addbottle', to: 'bottle_reports#create'

  	post '/bottle_reports/updatebottle', to: 'bottle_reports#update'

  	delete '/bottle_reports/removebottle', to: 'bottle_reports#destroy'
>>>>>>> LVRUBYM-285:Implement api routes
  end
end
