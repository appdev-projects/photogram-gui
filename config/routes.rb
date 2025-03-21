Rails.application.routes.draw do
  # Set the root route to display users#index
  root "users#index"

  # Users
  get    "/users/new",       to: "users#new",    as: :new_user
  get    "/users",           to: "users#index"
  get    "/users/:id",       to: "users#show",   as: :user
  get    "/users/:id/edit",  to: "users#edit",   as: :edit_user
  post   "/users",           to: "users#create"
  patch  "/users/:id",       to: "users#update"
  delete "/users/:id",       to: "users#destroy"

  # Photos
  get    "/photos/new",      to: "photos#new",   as: :new_photo
  get    "/photos",          to: "photos#index", as: :photos
  get    "/photos/:id",      to: "photos#show",  as: :photo
  # Inline editing only, so no edit route:
  # get    "/photos/:id/edit", to: "photos#edit", as: :edit_photo

  post   "/photos",          to: "photos#create"
  patch  "/photos/:id",      to: "photos#update"
  delete "/photos/:id",      to: "photos#destroy"

  # Custom route for test: GET "/delete_photo/:id" => destroy photo
  get "/delete_photo/:id", to: "photos#destroy", as: :delete_photo

  # Comments
  post "/comments", to: "comments#create"
end
