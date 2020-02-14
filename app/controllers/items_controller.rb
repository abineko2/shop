class ItemsController < ApplicationController
  before_action :set_item,only:[:edit, :destroy, :update, :deleteModal]

  #アイテム一覧
  def index
    @flash = params[:para] if params
    @items = Item.paginate(page: params[:page], per_page: 5).order('id asc')
  end

  #モバイル版アイテム一覧
  def phone
    @flash = params[:para] if params
    @items = Item.paginate(page: params[:page], per_page: 5).order('id asc')  
  end

  #新規登録モーダル
  def new
    @item = Item.new
  end

  #商品登録
  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to items_path(params:{para: 1})
    else 
      redirect_to items_path(params:{para: 4})
    end  
  end

  #編集モーダル
  def edit
  end

  #編集アップデート
  def update
    if @item.update_attributes(item_parameter)
      redirect_to items_path(params:{para: 2})
    else  
      redirect_to items_path(params:{para: 4})
    end  
  end
  

  #削除モーダル
  def deleteModal
  end

  #削除処理
  def destroy
    @item.destroy
    redirect_to items_path(params:{para: 3})
  end
  
  #在庫管理
  def stock
    stock_parameter.each do |id,item|
      obj = Item.find id
      obj.update_attributes(item)
    end  
    redirect_to items_path(params:{para:5})
  end
  
  
  

  def show
  end

private
  def item_parameter
    params.require(:item).permit(:name, :baika, :genka, :jan)
  end

  def stock_parameter
    params.permit(items: [:stock])[:items]
  end
  

  def set_item
    @item = Item.find(params[:id])
  end

end
