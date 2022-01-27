class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # 1. 追加した商品がカート内に存在するかの判別
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      # 存在した場合
      # 2. カート内の個数をフォームから送られた個数分追加する 
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else  
       # 存在しなかった場合
      # カートモデルにレコードを新規作成する
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

 private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
