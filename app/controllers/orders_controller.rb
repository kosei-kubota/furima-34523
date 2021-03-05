class OrdersController < ApplicationController
  before_action :anthenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:price)
  end
end
