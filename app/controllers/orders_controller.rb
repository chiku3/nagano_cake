class OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order_detail = OrderDetail.new
    @order.payment_method = params[:order][:payment_method]
    @customer = current_customer
    if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1"
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        @order.address = Address.find(params[:order][:address_id]).address
        @order.name = Address.find(params[:order][:address_id]).name

    elsif params[:order][:select_address] == "2"
    end
  end

  def create
    @order = Order.new(order_params)
    cart_items = CartItem.all
    if @order.save
        cart_items.each do |cart_item|
          order_detail = OrderDetail.new
            order_detail.item_id = cart_item.item_id
            order_detail.order_id = @order.id
            order_detail.price = cart_item.item.add_tax_price
            order_detail.amount = cart_item.amount
          order_detail.save
        end
    end
      redirect_to orders_complete_path
      cart_items.destroy_all
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

 private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address,
    :name, :shipping_cost, :total_payment, :payment_method)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount)
  end
  
end
