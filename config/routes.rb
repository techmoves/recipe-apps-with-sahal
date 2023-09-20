Rails.application.routes.draw do
  root 'foods#index'

  resources :foods, only: [:index, :show, :new, :create, :destroy]

  # resources :shopping_lists, only: [:index]
  get '/general_shopping_list', to: 'shopping_lists#index', as: 'general_shopping_list'

  resources :recipes, only: [:show, :destroy] do
    member do
      patch 'toggle_public'
    end  
  end
  get '/recipes', to: 'recipes#index', as: 'recipes'

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
end
