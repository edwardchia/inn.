class ListingsController < ApplicationController
    before_action :authorize_user!, only: [:destroy, :edit, :update] 
  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.all
  end

  def create
    @listing = Listing.new listing_params
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing.id)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find params[:id]
  end

  def edit
  end

  def update
    if @listing.update listing_params
      redirect_to listing_path(@listing.id)
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy redirect_to listing_path
  end

  private

  def listing_params
    params.require(:listing).permit(:address, :price, :amenities, :description, :image_location)
  end

  def authorize_user!
    redirect_to root_path, alert: 'Access Denied!' unless can? :crud, @listing
  end
end

