Rails.application.routes.draw do
  resources :images
  root 'images#index'
  get '/tagged', to: 'images#tagged', as: :tagged

  resources :feedbacks, only: [:new]

  namespace :api do
    resource :feedbacks, only: [:create]
  end
end
