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
    @tenant = Tenant.find(params[:id])
  end


private

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :phone_number,
      :landlord_id, :building_id, :apartment_id, notice_ids: [])
  end

  # post_ids: [], picture_ids: [])

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number,
  #    :email, :password, :password_confirmation) }
  # end ?????????????????


end