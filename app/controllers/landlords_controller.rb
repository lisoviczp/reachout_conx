class LandlordsController < ApplicationController
  before_action :authenticate_landlord!
  

  def index
    @landlord = Landlord.all
  end

  def show
    @landlord = Landlord.find(params[:id])
  end

  def edit
    @landlord = Landlord.find(params[:id])
  end

  def update
    @landlord = Landlord.find(params[:id])

    if @landlord.update(landlord_params)
      redirect_to @landlord
    else
      render :new
    end
  end

  def new
    @landlord = Landlord.new
  end

private

  def landlord_params
    params.require(:landlord).permit(:first_name, :last_name, :email, :phone_number,
      building_ids: [], apartment_ids: [], tenant_ids: [], notice_ids: [])
  end

  # post_ids: [], picture_ids: [])


end
