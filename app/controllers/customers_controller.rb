class CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer
    else
      render json: { errors: @customer.errors.full_messages }
    end
  end

  def show
    @customer = Customer.find_by_id(params[:id])
    if @customer
      render json: @customer
    else
      render json: nil, status: :not_found
    end
  end

  def update
    @customer = Customer.find_by_id(params[:id])
    if @customer
      if @customer.update(customer_params)
        render json: @customer
      else
        render json: { errors: @customer.errors.full_messages }
      end
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    @customer = Customer.find_by_id(params[:id])
    if @customer
      if @customer.destroy
        render json: nil
      else
        render json: nil, status: :errors
      end
    else
      render json: nil, status: :not_found
    end
  end

  private
    def customer_params
      params.permit(:email, :first_name, :last_name, :profile_picture)
    end
end
