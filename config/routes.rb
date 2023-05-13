Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})

  get("/users", {:controller => "users", :action => "index"})
  get("/users/:username", {:controller=> "users", :action => "show"})
  get("/create_user", {:controller => "users", :action => "create"})
  get("/update_user/:user_id", {:controller => "users", :action => "update"})


  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photo_id", {:controller => "photos", :action => "show"})
  get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})
  get("/create_photo", {:controller => "photos", :action => "create"})
  get("/update_photo/:photo_id", {:controller => "photos", :action => "update"})

end
