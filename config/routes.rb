Rails.application.routes.draw do
  namespace :v1 do
    resources :groups do
      resources :students, shallow: true
    end
  end
end
