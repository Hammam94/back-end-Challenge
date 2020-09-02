Rails.application.routes.draw do
  get 'monopolists', to: 'users#monopolists_list'
  post 'trips/create', to: 'trips#create'

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'sessions',
        token_validations: 'overrides/token_validations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
