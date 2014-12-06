class BuildingsController < ApplicationController
  def index
  	@building = Building.all
  end

  def show
  	@building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])

    if @building.update(building_params)
      redirect_to @building
    else
      render :new
    end
  end

  def create
    @building = Building.new(building_params)
 
    if @building.update(building_params)
      redirect_to @building
    else
      render :new
    end
  end

  def new
    @building = Building.new
  end


private

  def building_params
    params.require(:building).permit(:address, :city, :state, :zipcode, :number_of_apartments, 
    	:building_code, :landlord_id, apartment_ids: [], tenant_ids: [])
  end

  # post_ids: [], picture_ids: [])


end

