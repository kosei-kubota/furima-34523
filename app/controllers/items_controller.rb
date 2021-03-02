class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@user)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :description, :condition_id, :burden_id, :country_id, :image, :day_id).merge(user_id: current_user.id)
  end
end
