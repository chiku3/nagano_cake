class CartItemsController < ApplicationController
  def index
  end

  def updatee
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end

 private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amout)
  end
end
