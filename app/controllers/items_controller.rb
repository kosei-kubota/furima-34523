class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :description, :condition_id, :burden_id, :country_id, :image, :day_id).merge(user_id: current_user.id)
  end

  def items_params
    params.require(:item).permit(:name, :category_id, :price, :description, :condition_id, :burden_id, :country_id, :image, :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
