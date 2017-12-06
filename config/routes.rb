Rails.application.routes.draw do
  resources :trips

  get 'users/index'
  post 'users/signup'
  post 'users/signin'
  delete 'users/singout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
