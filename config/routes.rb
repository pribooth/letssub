Rails.application.routes.draw do
  root :to => "searches#index"
  # Routes for the Listing resource:

  # CREATE
  get("/listings/new", { :controller => "listings", :action => "new_form" })
  post("/create_listing", { :controller => "listings", :action => "create_row" })

  # READ
  get("/listings", { :controller => "listings", :action => "index" })
  get("/listings/:id_to_display", { :controller => "listings", :action => "show" })

  # UPDATE
  get("/listings/:prefill_with_id/edit", { :controller => "listings", :action => "edit_form" })
  post("/update_listing/:id_to_modify", { :controller => "listings", :action => "update_row" })

  # DELETE
  get("/delete_listing/:id_to_remove", { :controller => "listings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Search resource:

  # CREATE
  get("/searches/new", { :controller => "searches", :action => "new_form" })
  post("/create_search", { :controller => "searches", :action => "create_row" })

  # READ
  get("/searches", { :controller => "searches", :action => "index" })
  get("/searches/:id_to_display", { :controller => "searches", :action => "show" })

  # UPDATE
  get("/searches/:prefill_with_id/edit", { :controller => "searches", :action => "edit_form" })
  post("/update_search/:id_to_modify", { :controller => "searches", :action => "update_row" })

  # DELETE
  get("/delete_search/:id_to_remove", { :controller => "searches", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
