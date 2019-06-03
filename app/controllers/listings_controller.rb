class ListingsController < ApplicationController
  def index
    @q = Listing.ransack(params[:q])
    @listings = @q.result(:distinct => true).page(params[:page]).per(10)

    render("listing_templates/index.html.erb")
  end

  def show
    @listing = Listing.find(params.fetch("id_to_display"))

    render("listing_templates/show.html.erb")
  end

  def new_form
    @listing = Listing.new

    render("listing_templates/new_form.html.erb")
  end

  def create_row
    @listing = Listing.new

    @listing.lister = params.fetch("lister")

    if @listing.valid?
      @listing.save

      redirect_back(:fallback_location => "/listings", :notice => "Listing created successfully.")
    else
      render("listing_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @listing = Listing.find(params.fetch("prefill_with_id"))

    render("listing_templates/edit_form.html.erb")
  end

  def update_row
    @listing = Listing.find(params.fetch("id_to_modify"))

    @listing.lister = params.fetch("lister")

    if @listing.valid?
      @listing.save

      redirect_to("/listings/#{@listing.id}", :notice => "Listing updated successfully.")
    else
      render("listing_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @listing = Listing.find(params.fetch("id_to_remove"))

    @listing.destroy

    redirect_to("/listings", :notice => "Listing deleted successfully.")
  end
end
