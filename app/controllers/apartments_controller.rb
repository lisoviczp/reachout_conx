class ApartmentsController < ApplicationController
  def index
  	@apartment = Apartment.all
  end

  def show
  	@apartment = Apartment.find(params[:id])
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])

    if @apartment.update(apartment_params)
      redirect_to @apartment
    else
      render :new
    end
  end

  def create
    @apartment = Apartment.new(apartment_params)
 
    if @apartment.update(apartment_params)
      redirect_to @apartment
    else
      render :new
    end
  end


  def new
    @apartment = Apartment.new
  end


private

  def apartment_params
    params.require(:apartment).permit(:apartment_number, :number_of_tenants, :apartment_code, 
    	:building_id, :landlord_id, tenant_ids: [])
  end

  # post_ids: [], picture_ids: [])


end

