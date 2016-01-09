Rails.application.routes.draw do


  get "/login" => "sessions#new", as: "root",                     defaults: {format: :json}
  post "/login" => "sessions#create",                             defaults: {format: :json}
  delete "/logout" => "sessions#destroy",                         defaults: {format: :json}

  get "/user/:id" => "users#show",                                defaults: {format: :json}
  get "/user" => "users#new",                                     defaults: {format: :json}
  post "/user" => "users#create",                                 defaults: {format: :json}

  get "/recipe/id" => "recipes#show",                             defaults: {format: :json}
  post "/recipe/:recipe_id/steps" => "recipes#steps",             defaults: {format: :json}

  get "/cook_book/:id" => "cook_books#show",                      defaults: {format: :json}
  post "/cook_book/:cook_book_id/recipe" => "recipes#create",     defaults: {format: :json}
  delete "/cook_book/:id" => "cook_books#destroy",                defaults: {format: :json}

  get "/note/:id" => "notes#show",                                defaults: {format: :json}
  post "/recipe/:recipe_id/notes" => "notes#recipes",             defaults: {format: :json}
  post "/step/:step_id/notes" => "notes#steps",                   defaults: {format: :json}
end
