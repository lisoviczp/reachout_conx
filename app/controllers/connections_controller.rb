class ConnectionsController < ApplicationController


  def index
    # @connection = Connection.all
    @current_connections = []
    if landlord_signed_in?
      Connection.all.each do |connection|
        if connection.landlord == current_landlord && connection.approved
          @current_connections << connection
          # @user = current_landlord
          # @tenants = Tenant.where(apartment_id: connection.apartment_id)
        end
      end
    elsif tenant_signed_in?
      Connection.all.each do |connection|
        if connection.apartment == current_tenant.apartment && connection.approved
          @current_connections << connection
          # @user = current_tenant
          # @tenants = Tenant.where(apartment_id: connection.apartment_id)
        end
      end
    else
      redirect_to root_path
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
    # if @connection.available?
      if landlord_signed_in?
        @connection.landlord = current_landlord
      else
        # @connection.landlord = current_tenant.landlord
        current_tenant.apartment = @connection.apartment
        current_tenant.connection = @connection
        current_tenant.save
      end

      if @connection.update(connection_params)
        redirect_to @connection
      else
        render :new
      end
    # else
    #   @connection.destroy
    #   redirect_to new_connection_path
    # end
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

  def approve
    if landlord_signed_in?
      @connection = Connection.where(landlord: current_landlord)
    else
      redirect_to root_path
    end
  end

  def approve_connections
    #TODO mark all conections as approved
    binding.pry
    Connection.update_all([approved=true], :id => params[:connection_ids])
    redirect_to root_path
  end


private

  def connection_params
    params.require(:connection).permit(:start_date, :end_date, :apartment_id, :landlord_id, 
      :apartment_city, :landlord_name, :city, :approved, tenant_ids: [])
  end

  # post_ids: [], picture_ids: [])


end