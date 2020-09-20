Rails.application.routes.draw do
  #resources :answers

  resources :tests do
    resources :questions
  end
  #resources :categories
  #resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
