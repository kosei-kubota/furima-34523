class OrdersController < ApplicationController
  before_action :anthenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

end
