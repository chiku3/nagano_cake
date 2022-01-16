class OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

 private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address,
    :name, :shipping_cost, :total_payment, :payment_method)
  end
end
