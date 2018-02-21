Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :wikis do 
    collection do 
      get :autocomplete
    end
    resources :collaborators
  end
  
  resources :charges, only: [:new, :create]
  
  put 'downgrade', to: "users#downgrade"
  get "search_results", to: "wikis#search"

end
