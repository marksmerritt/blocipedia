Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :wikis do 
    resources :collaborators
  end
  
  resources :charges, only: [:new, :create]
  
  put 'downgrade', to: "users#downgrade"

end
