class OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end
  
  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
  end
  
  def create
  end

  def complete
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
