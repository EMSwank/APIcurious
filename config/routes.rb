Rails.application.routes.draw do
  root to: "users#new"
  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/github" => "sessions#create", as: :github_login
  delete "/logout", to: "seesions#destroy", as: :sign_out
end
