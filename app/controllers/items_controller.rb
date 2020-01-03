class ItemsController < ApplicationController

  #アイテム一覧
  def index
    @items = Item.all
  end

  #新規登録モーダル
  def new
    @item = Item.new
  end

  #商品登録
  def create
    @item = Item.new(item_parameter)
    if @item.save
      flash[:sucess] = "登録しました。"
      redirect_to items_path
    else  
      render :new
    end  
  end
  

  def show
  end

private
  def item_parameter
    params.require(:item).permit(:name, :baika, :genka, :jan)
  end
  

end
