class VendorsController < ApplicationController
  def index
    render json: Vendor.all
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      render json: @vendor
    else
      render json: { errors: @vendor.errors.full_messages }
    end
  end

  def show
    @vendor = Vendor.find_by_id(params[:id])
    if @vendor
      render json: @vendor
    else
      render json: nil, status: :not_found
    end
  end

  def update
    @vendor = Vendor.find_by_id(params[:id])
    if @vendor
      if @vendor.update(vendor_params)
        render json: @vendor
      else
        render json: { errors: @vendor.errors.full_messages }
      end
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    @vendor = Vendor.find_by_id(params[:id])
    if @vendor
      if @vendor.destroy
        render json: nil
      else
        render json: { errors: @vendor.errors.full_messages }
      end
    else
      render json: nil, status: :not_found
    end
  end

  private
    def vendor_params
      params.require(:vendor).permit(:email, :first_name, :last_name)
    end
end
