Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/users", { :controller => "users", :action => "list" })
  get("/users/:path_id", { :controller => "users", :action => "show" })
  post("/add_user", { :controller => "users", :action => "insert" })
  post("/edit_user/:path_id",{:controller => "users",:action => "edit"})

  get("/photos",{:controller => "photos",:action=>"list"})
  get("/photos/:path_id", { :controller => "photos", :action => "show" })

end
