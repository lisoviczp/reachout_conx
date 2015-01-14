class ConnectionsController < ApplicationController
  before_action :authenticate_landlord!
  

  def index
    @connection = Connection.all
  end

  def show
    @connection = Connection.find(params[:id])
  end

  def edit
    @connection = Connection.find(params[:id])
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
      tenant_ids: [])
  end

  # post_ids: [], picture_ids: [])


end