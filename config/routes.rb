Rails.application.routes.draw do
 
  devise_for :users
    
  get "documents/query"

  get "documents/index"

  get "documents/create"
  
  get "documents/show"
  
  resources :documents
  
  resources :users, only: [:update]
  
  get 'about' => 'welcome#about'
  
  get 'contact' => 'welcome#contact'
  
  get 'search' => 'documents#search'
  
  get 'Raven' => 'welcome#index'
  
  root to: 'welcome#index'
  
end