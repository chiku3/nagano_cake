class ItemsController < ApplicationController
  def index
  end

  def show
  end

 private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price)
  end
  
end