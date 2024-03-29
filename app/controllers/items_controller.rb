class ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer
  end

 private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price)
  end

end