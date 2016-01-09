Rails.application.routes.draw do


  get "/login" => "sessions#new", as: "root",  defaults: {format: :json}
  post "/login" => "sessions#create",          defaults: {format: :json}
  delete "/logout" => "sessions#destroy",      defaults: {format: :json}
  get "/user/:id" => "users#show",              defaults: {format: :json}
  get "/user" => "users#new",                   defaults: {format: :json}
  post "/user" => "users#create",               defaults: {format: :json}
end
