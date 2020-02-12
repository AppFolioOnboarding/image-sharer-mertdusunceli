Rails.application.routes.draw do
  #get 'welcome/index'
  #resources :articles do
  #  resources :comments
  #end
  #root 'welcome#index'
  resources :images
  root 'images#index'
end
