class DetailsController < ApplicationController
  def index
    @detail = Detail.all
  end

  def show
    @detail = Detail.find(params[:id])
  end

  def new
    if landlord_signed_in?
      @detail = Detail.new
    else
      redirect_to root_path
    end
  end

  def create
    @detail = Detail.new(detail_params)

    if @detail.update(detail_params)
      redirect_to @detail
    else
      render :new
    end
  end

  def update
    @detail = Detail.find(params[:id])

    if @detail.update(detail_params)     
      redirect_to @detail
    else
      render :new
    end
  end

  def edit
    if landlord_signed_in?
      @detail = Detail.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
    # redirect_to root_path, notice: 'Notice Deleted'
  end

private

  def detail_params
    params.require(:notice).permit(:building_id)
  end

end
