class NoticesController < ApplicationController
  def index
    @notice = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
    @apartment = Apartment.where(id: @notice.apartment_id)
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    if current_tenant
      @notice.tenant = current_tenant
      @notice.apartment_id = current_tenant.apartment_id
    elsif current_landlord 
      @notice.landlord = current_landlord
    end

    if @notice.update(notice_params)
      redirect_to @notice
    else
      render :new
    end
  end

  def update
    @notice = Notice.find(params[:id])

    if @notice.update(notice_params)     
    	redirect_to @notice
    else
      render :new
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to root_path, notice: 'Notice Deleted'
  end

private

  def notice_params
    params.require(:notice).permit(:title, :body, :notice_type, :received, :tenant_id, :landlord_id, :apartment_id)
  end

end
