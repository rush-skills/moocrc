Rails.application.routes.draw do
  resources :courses
  resources :deadlines
  resources :users
 
  get '/courses/create_deadline/:id' => 'courses#create_deadline', :as => :create_deadline
  get '/courses/deadline_save/:id' => 'courses#deadline_save'
  post '/courses/deadline_save/:id' => 'courses#deadline_save'

  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/users/update_courses/:id' => 'users#update_courses', :as => :update_courses
  get '/courses/completed/' => 'courses#completed', :as => :completed_path
  get '/courses/failed' => 'courses#failed', :as => :failed_path
end
