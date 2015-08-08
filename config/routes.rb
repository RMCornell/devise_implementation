Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
end
