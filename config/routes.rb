Rails.application.routes.draw do

  root "sessions#new"

  get "/login" => "sessions#new",                                 defaults: {format: :json}
  post "/login" => "sessions#create",                             defaults: {format: :json}
  delete "/logout" => "sessions#destroy",                         defaults: {format: :json}

  get "/users" => "users#index",                                  defaults: {format: :json}

  get "/user/:id" => "users#show",                                defaults: {format: :json}
  get "/user" => "users#new",                                     defaults: {format: :json}
  post "/user" => "users#create",                                 defaults: {format: :json}
  #registration ^

  get "/recipe/:id" => "recipes#show",                             defaults: {format: :json}
  post "/recipe/:id/steps" => "recipes#steps",                    defaults: {format: :json}
  #add a new step to recipe ^
  post "/recipe/:id/ingredients" => "recipe#ingredients",         defaults: {format: :json}

  get "/cook_book/:id" => "cook_books#show",                      defaults: {format: :json}
  get "/cook_book/search" => "cook_books#show",                    defaults: {format: :json}
  #No need for a post, created with a kitchen.

  get "/shopping_list/:id" => "shopping_lists#show",              defaults: {format: :json}
  #No need for a post, created with a kitchen.
  post "/shopping_list/:id/ingredients" => "shopping_list#ingredients", defaults: {format: :json}

  get "/kitchen/:id" => "kitchens#show",                          defaults: {format: :json}
  post "/kitchen/" => "kitchens#create",                           defaults: {format: :json}
  delete "/kitchen/:id" => "kitchens#destroy",                    defaults: {format: :json}
  # This will trash EVERYTHING but a user. Dependent destroy everywhere

  # Josh
  get "/kitchen/search" => "kitchen#search",                     defaults: {format: :json}

  get "/kitchen/:id/join" => "kitchens#join",                     defaults: {format: :json}

  get "/note/:id" => "notes#show",                                defaults: {format: :json}
  post "/recipe/:recipe_id/notes" => "notes#recipes",             defaults: {format: :json}

  get "/cook_book/:id/recipes/search" => "recipes#search",         defaults: {format: :json}
end
