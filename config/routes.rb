Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deals, only: [:index] # only need the index endpoint

  root to: 'deals#index' # project has only one page for the deals summary chart
end
