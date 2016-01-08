Rails.application.routes.draw do


  get "/login" => "sessions#new", as: "root",  defaults: {format: :json}
  post "/login" => "sessions#create",          defaults: {format: :json}
  delete "/logout" => "sessions#destroy",      defaults: {format: :json}
  get "/user/:id" => "user#show",              defaults: {format: :json}
  get "/user" => "user#new",                   defaults: {format: :json}
  post "/user" => "user#create",               defaults: {format: :json}
  get "/recipe" => "recipe#new",               defaults: {format: :json}
  post "/recipe" => "recipe#create",           defaults: {format: :json}
  get "/recipe/:id" => "recipe#show",          defaults: {format: :json}
end
