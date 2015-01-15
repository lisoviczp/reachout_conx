class NoticesController < ApplicationController
  def index
    # @notice = Notice.all  
    @current_notices = []
    if landlord_signed_in?
      Notice.all.each do |notice|
        if notice.landlord == current_landlord
          @current_notices << notice
          @user = current_landlord
        end
      end
    elsif tenant_signed_in?
      Notice.all.each do |notice|
        if notice.apartment == current_tenant.apartment
          @current_notices << notice
          @user = current_tenant
        end
      end
    end
  end

  def show
    @notice = Notice.find(params[:id])
    @apartment = Apartment.where(id: @notice.apartment_id)
  end

  def new
    @notice = Notice.new
    if landlord_signed_in?
      @landlord = current_landlord
    elsif tenant_signed_in?
      @tenant = current_tenant
    end
  end

  def create
    @notice = Notice.new(notice_params)

    # should this be tenant_signed_in?

    if current_tenant
      @tenant = current_tenant
      @notice.tenant = current_tenant
      @notice.apartment_id = current_tenant.apartment_id
      # Here's the mailer!!!
      if @notice.save
        # UserMailer.notice_email(@tenant, @notice).deliver
      end
    elsif current_landlord 
      @notice.landlord = current_landlord
      @landlord = current_landlord
      # Here's the mailer!!!
      if @notice.save
        # UserMailer.notice_email(@landlord, @notice).deliver
      end
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
