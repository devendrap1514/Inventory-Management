class ProductsController < ApplicationController
  def index
    limit = params[:limit]
    if limit != nil
      if limit.to_i > 50.abs
        render json: { message: "limit must be less than 50" }
      else
        render json: Product.limit(limit)
      end
    else
      render json: Product.limit(50)
    end

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }
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

  def images
    @product = Product.find_by_id(params[:id])
    if @product
      if @product.product_images.attach(params[:product_images])
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

  def search
    @products = Product.where("name LIKE ?", "#{params[:name]}%")
    render json: @products
  end

  def delete_by_name
    @products = Product.where("name LIKE ?", "#{params[:name]}")
    @products.destroy_all
    render json: nil
  end

  private
    def product_params
      params.permit(:name, :brand_name, :vendor_id, product_images: [])
    end
end
