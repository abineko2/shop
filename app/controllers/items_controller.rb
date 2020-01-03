class ItemsController < ApplicationController

  #アイテム一覧
  def index
    @items = Item.all
  end

  def show
  end
end
