class ProductsController < ApplicationController
  def index
    render json: Product.all
  end

  def create
    @vendor = Vendor.find_by_id(params[:vendor_id])
    if @vendor
      @product = @vendor.products.new(product_params)
      if @product.save
        render json: @product
      else
        render json: { errors: @product.errors.full_messages}
      end
    else
      render json: nil, status: :not_found
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
    if @product
      render json: @product
    else
      render json: nil, status: :not_found
    end
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product
      if @product.update(product_params)
        render json: @product
      else
        render json: { errors: @product.errors.full_messages }
      end
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    if @product
      if @product.destroy
        render json: nil
      else
        render json: nil, status: :not_found
      end
    else
      render json: nil, status: :not_found
    end
  end

  def view_vendor_product
    @vendor = Vendor.find_by_id(params[:id])
    if @vendor
      render json: @vendor.products
    else
      render json: nil, status: :not_found
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :brand_name)
    end
end
