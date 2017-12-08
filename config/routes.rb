Rails.application.routes.draw do
  # resources :spots
  # resources :days
  # resources :trips do
  #   collection do
  #     get 'page/:page' => 'trips#page'
  #   end
  # end

  # users
  get 'users/index'
  post 'users/signup'
  post 'users/signin'

  # trips

  get 'trips' => 'trips#index'
  get 'trips/page/:page' => 'trips#page'
  post 'trips' => 'trips#create'
  get 'trips/:tid' => 'trips#show'
  put 'trips/:tid' => 'trips#update'
  patch 'trips/:tid' => 'trips#update'
  delete 'trips/:tid' => 'trips#destroy'

  # days

  get 'trips/:tid/days' => 'days#index'
  get 'trips/:tid/days/page/:page' => 'days#page'
  post 'trips/:tid/days' => 'days#create'
  get 'days/:did' => 'days#show'
  put 'days/:did' => 'days#update'
  patch 'days/:did' => 'days#update'
  delete 'days/:did' => 'days#destroy'

  # spots

  get 'trips/:tid/days/:did/spots' => 'spots#index'
  get 'trips/:tid/days/:did/spots/page/:page' => 'spots#page'
  post 'trips/:tid/days/:did/spots' => 'spots#create'
  get 'spots/:did' => 'spots#show'
  put 'spots/:sid' => 'spots#update'
  patch 'spots/:sid' => 'spots#update'
  delete 'spots/:sid' => 'spots#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
