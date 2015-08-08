Rails.application.routes.draw do

  root 'users#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  get '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
