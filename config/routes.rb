Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :characters
  resources :skills
  resources :character_skills
  resources :defenses
  resources :attacks

  get "user/info", to: "users#user_info"

  patch "character_skill/update", to: "character_skills#update_skill"
end
