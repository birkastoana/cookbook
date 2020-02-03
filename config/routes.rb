Rails.application.routes.draw do

  match '/401', to: 'errors#unauthorized', via: :all, as: :unauthorized
  match '/404', to: 'errors#not_found', via: :all, as: :not_found
  match '/500', to: 'errors#internal_error', via: :all, as: :internal_error

  #get '/' equals >>root 'recipes#index'<< !!
  #get '/', to: 'recipes#index'
  root 'recipes#index'


  get 'recipes/delete'
  get 'ingredients/delete'
  get 'recipe_ingredients/delete'

  resources :recipes

  resources :ingredients

  resources :recipe_ingredients
  #
  #get '/recipes', to: 'recipes#index'
  #get '/recipes/new', to: 'recipes#new'
  #post '/recipes', to: 'recipes#create'
  #get '/recipes/:id', to: 'photos#show'
  #get '/photos/:id/edit', to: 'photos#edit'
  #put '/photos/:id', to: 'photos#update'
  #delete '/photos/:id', to: 'photos#destroy'

  #post :recipes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
