Rails.application.routes.draw do
  namespace :v1, defaults: {format: 'json'} do
    devise_for :users, controllers: {
        registrations: 'v1/custom_devise/registrations',
        confirmations: 'v1/custom_devise/confirmations',
        sessions: 'v1/custom_devise/sessions'
    }
    resources :users, only:[:create, :update]
    resources :schools
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
