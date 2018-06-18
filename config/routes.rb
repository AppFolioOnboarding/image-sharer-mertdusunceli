Rails.application.routes.draw do
  resources :images
  root 'images#index'
  get '/tagged', to: 'images#tagged', as: :tagged

  resources :feedbacks, only: [:new]
end
