Rails.application.routes.draw do

  get "/login" => "sessions#new", as: "login", defaults: {format: :json}
  post "/login" => "sessions#create",          defaults: {format: :json}
  delete "/logout" => "sessions#destroy",      defaults: {format: :json}
end
