class TenantsController < ApplicationController
  before_action :authenticate_tenant!

  def index
    @tenant = Tenant.all
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    @tenant = Tenant.find(params[:id])

    if @tenant.update(tenant_params)
      redirect_to @tenant
    else
      render :new
    end
  end

  def new
    @tenant = Tenant.new
  end


  def find
    
  end


private

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :phone_number,
      :landlord_id, :building_id, :apartment_id)
  end

  # post_ids: [], picture_ids: [])


end