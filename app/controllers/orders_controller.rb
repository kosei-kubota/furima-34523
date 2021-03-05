class OrdersController < ApplicationController
  before_action :anthenticate_user!, except: :index

  def index
  end
  
end
