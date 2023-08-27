class CartsController < ApplicationController
  def index
    @customer = Customer.find_by_id(params[:customer_id])
    if @customer
      render json: @customer.carts
    else
      render json: nil, status: :not_found
    end
  end

  def create
    unless is_product_variant_exist(params[:customer_id], params[:product_variant_id])
      @cart = Cart.new(cart_params)
      if @cart.save
        render json: @cart
      else
        render json: { errors: @cart.errors.full_messages }
      end
    else
      @obj = Cart.find_by(customer_id: params[:customer_id], product_variant_id: params[:product_variant_id])
      @obj.update(quantity: (@obj.quantity + params[:quantity]))
      render json: @obj
    end
  end

  def is_product_variant_exist(customer_id = nil, product_variant_id = nil)
    Cart.exists?(customer_id: customer_id, product_variant_id: product_variant_id)
  end

  def show
    @cart = Cart.find_by_id(params[:id])
    if @cart
      render json: @cart
    else
      render json: nil, status: :not_found
    end
  end

  def update
    @cart = Cart.find_by_id(params[:id])
    if @cart
      if @cart.update(quantity: params[:quantity])
        render json: @cart
      else
        render json: nil, status: :errors
      end
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    @cart = Cart.find_by_id(params[:id])
    if @cart
      if @cart.destroy
        render json: nil
      else
        render json: nil, status: :not_found
      end
    else
      render json: nil, status: :not_found
    end
  end

  def destroy_all
    @customer = Customer.find_by_id(params[:id])
    if @customer
      if @customer.carts.destroy_all
        render json: nil
      else
        render json: nil, status: :errors
      end
    else
      render json: nil, status: :not_found
    end
  end

  private
    def cart_params
      params.require(:cart).permit(:quantity, :product_variant_id, :customer_id)
    end
end
