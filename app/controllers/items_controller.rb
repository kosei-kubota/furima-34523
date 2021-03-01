class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :description, :condition_id, :burden_id, :country_id, :image).merge(user_id: current_user.id)
  end
end
