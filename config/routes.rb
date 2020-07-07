Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'v1/custom_devise/registrations',
      confirmations: 'v1/custom_devise/confirmations',
      sessions: 'v1/custom_devise/sessions'
  }

  namespace :v1, defaults: {format: 'json'} do
    resources :schools, only: [:index, :create, :update, :destroy]
    resources :recipients, only: [:index, :update, :destroy]
    resources :orders, only: [:create, :update]

    get 'orders/:school_id', to: 'orders#index'
    patch 'orders/:order_id/cancel', to: 'orders#cancel'
    patch 'orders/:order_id/ship', to: 'orders#ship'
    post 'recipient/:school_id', to: 'recipients#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
