class ProductVariantsController < ApplicationController
  def index
    render json: ProductVariant.all
  end

  def create
    @product_variant = ProductVariant.new(product_variant_params)
    if @product_variant.save
      render json: @product_variant
    else
      render json: { errors: @product_variant.errors.full_messages}
    end
  end

  def show
    @product_variant = ProductVariant.find_by_id(params[:id])
    if @product_variant
      render json: @product_variant
    else
      render json: nil, status: :not_found
    end
  end

  def update
    @product_variant = ProductVariant.find_by_id(params[:id])
    if @product_variant
      if @product_variant.update(product_variant_params)
        render json: @product_variant
      else
        render json: { errors: @product_variant.errors.full_messages }
      end
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    @product_variant = ProductVariant.find_by_id(params[:id])
    if @product_variant
      if @product_variant.destroy
        render json: nil
      else
        render json: nil, status: :not_found
      end
    else
      render json: nil, status: :not_found
    end
  end

  def view_product_variants
    @product = Product.find_by_id(params[:id])
    if @product
      render json: @product.product_variants
    else
      render json: nil, status: :not_found
    end
  end

  def view_vendor_product_variants

  end

  private
    def product_variant_params
      params.require(:product_variant).permit(:length, :width, :product_id)
    end
end
