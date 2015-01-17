class ConnectionsController < ApplicationController


  def index
    # @connection = Connection.all
    @current_connections = []
    if landlord_signed_in?
      Connection.all.each do |connection|
        if connection.landlord == current_landlord
          @current_connections << connection
          # @user = current_landlord
          # @tenants = Tenant.where(apartment_id: connection.apartment_id)
        end
      end
    elsif tenant_signed_in?
      Connection.all.each do |connection|
        if connection.apartment == current_tenant.apartment
          @current_connections << connection
          # @user = current_tenant
          # @tenants = Tenant.where(apartment_id: connection.apartment_id)
        end
      end
    end
  end

  def show
    @connection = Connection.find(params[:id])
    @tenants = []
    Tenant.all.each do |tenant|
      if tenant.apartment == @connection.apartment
        @tenants << tenant
      end
    end

  end

  def edit
    @connection = Connection.find(params[:id])
  end

  def create
    @connection = Connection.new(connection_params)
 
    if landlord_signed_in?
      @connection.landlord = current_landlord
    else
      # @landlord = current_tenant.landlord
    end

    if @connection.update(connection_params)
      redirect_to @connection
    else
      render :new
    end
  end

  def update
    @connection = Connection.find(params[:id])

    if @connection.update(connection_params)
      redirect_to @landlord
    else
      render :new
    end
  end

  def new
    @connection = Connection.new

  end

private

  def connection_params
    params.require(:connection).permit(:start_date, :end_date, :apartment_id, :landlord_id, 
      :apartment_city, :landlord_name, :city, tenant_ids: [])
  end

  # post_ids: [], picture_ids: [])


end