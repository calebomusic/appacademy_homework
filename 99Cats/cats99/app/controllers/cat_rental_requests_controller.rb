class CatRentalRequestsController < ApplicationController
  def new
    @catrental = CatRentalRequest.new
    render :new
  end

  def create
    @catrental = CatRentalRequest.new(cat_rental_params)
    @catrental.save!
    redirect_to cats_url
  end

  def approve
    @catrental = CatRentalRequest.find_by(id: params[:id])
    @catrental.approve!
    cat = Cat.find_by(id: @catrental.cat_id)
    redirect_to cat_url(cat)
  end

  def deny
    @catrental = CatRentalRequest.find_by(id: params[:id])
    @catrental.deny!
    cat = Cat.find_by(id: @catrental.cat_id)
    redirect_to cat_url(cat)
  end

  private

  def cat_rental_params
    params.require(:cat_rental_requests).permit(:id, :cat_id, :start_date, :end_date)
  end
end
