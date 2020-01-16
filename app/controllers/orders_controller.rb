class OrdersController < ApplicationController
#発注topページ

  def index
    order_week_model
    @week = order_week
    @items = Item.all.order('id asc')
  end
  
end
