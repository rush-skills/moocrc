Rails.application.routes.draw do
  resources :courses
  resources :deadlines
  resources :users
 
  get '/courses/create_deadline/:id' => 'courses#create_deadline', :as => :create_deadline
  get '/courses/deadline_save/:id' => 'courses#deadline_save'

  root to: 'visitors#index'

  get '/home' => 'users#home'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/users/update_courses/:id' => 'users#update_courses', :as => :update_courses
end
