Rails.application.routes.draw do

  #mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout},
             controllers: { registrations: 'users/registrations' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
  #resources :categories
  #resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
