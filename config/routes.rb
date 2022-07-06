Rails.application.routes.draw do
  resources :class_rooms
  resources :courses
  resources :students
  resources :instructors
  resources :registrars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
