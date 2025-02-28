Rails.application.routes.draw do
  # Users
  get    "/users",          to: "users#index"
  get    "/users/:id",      to: "users#show"
  get    "/users/:id/edit", to: "users#edit"
  post   "/users",          to: "users#create"
  patch  "/users/:id",      to: "users#update"
  delete "/users/:id",      to: "users#destroy"

  # Photos
  get    "/photos",          to: "photos#index"
  get    "/photos/:id",      to: "photos#show"
  get    "/photos/:id/edit", to: "photos#edit"
  post   "/photos",          to: "photos#create"
  patch  "/photos/:id",      to: "photos#update"
  delete "/photos/:id",      to: "photos#destroy"
end
