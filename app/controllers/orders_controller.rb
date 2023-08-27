class OrdersController < ApplicationController
  def index
    @customer = Customer.find_by_id(params[:customer_id])
    if @customer
      render json: @customer.orders
    else
      render json: nil, status: :not_found
    end
  end

  def create
    @cart = Cart.find_by_id(params[:cart_id])
    if @cart
      @order = Order.new(customer_id: @cart.customer_id, product_variant_id: @cart.product_variant_id, quantity: @cart.quantity)
      if @order.save
        @cart.destroy
        render json: @order
      else
        render json: { errors: @order.errors.full_messages }
      end
    else
      render json: nil, status: :not_found
    end
  end

  def show
    @order = Order.find_by_id(params[:id])
    if @order
      render json: @order
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    if @order
      if @order.destroy
        render json: "Order history deleted"
      else
        render json: nil, status: :not_found
      end
    else
      render json: "No customer available", status: :not_found
    end
  end

  def destroy_all
    @customer = Customer.find_by_id(params[:id])
    if @customer
      if @customer.orders.destroy_all
        render json: "Orders history deleted"
      else
        render json: nil, status: :errors
      end
    else
      render json: "No customer available", status: :not_found
    end
  end
end
