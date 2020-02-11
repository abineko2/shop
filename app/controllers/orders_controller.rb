class OrdersController < ApplicationController
  before_action :index_page,only:[:index, :index2]
 
  #発注topページ

  def index
  end

  #発注topスマホページ

  def index2
  end
  

  #モーダル

  def modal
    @order = Order.find(params[:id])
  end

  #モーダル1週間

  def one_week
    @item = Item.find(params[:id])
  end



  #個別発注処理

  def orderOne
    @order = Order.find(params[:id])
    if @order.update_attributes(order_parameter)
      if @order.oder_number > 0
        @order.update_attributes(status: "申請中")
      elsif  @order.oder_number <= 0   
        @order.update_attributes(status: nil)
      end  
      flash[:success] = "入力しました。"
    else
      flash[:danger] = "失敗しました。"  
    end  
    redirect_to orders_path
  end

 #一週間発注処理

  def orderWeek
    week_parameter.each do |id,item|
      order = Order.find id
      if item[:oder_number].to_i >0
        order.status = 1
        order.update_attributes(item)
      elsif item[:oder_number].to_i <=0  
        order.update_attributes(status: 0)
      end  
    end  
    redirect_to orders_path
  end
  
#発注確認
  def check
    array = []
    @requestCount = Order.where(status: 1).count  #=>申請数
    @orders = Order.where(status: 1).order('order_day asc')
    @orders.each do |ob|
      array << ob.order_day
    end  
    @requests = array.uniq
    respond_to do |format|
      format.html do
      end 
      format.csv do
        send_data render_to_string, filename: "注文:#{Date.today}.csv", type: :csv   
      end
      format.pdf do
        test_pdf = TestPdf.new(params[:id])
        send_data test_pdf.render,
          filename:    'test.pdf',
          type:        'application/pdf',
          disposition: 'inline' # 画面に表示
      end
    end
  end
  
#申請に対する処理

def requests
  request_parameter.each do |id,item|
    order = Order.find id
    order.update_attributes(item)
    obj = order.item
    if item[:status] == "発送済み"
      obj.stock += order.oder_number
      obj.save
    end  
  end  
  redirect_to root_path
end

#申請の処理後のページ

def requestConfirm
  @shippings = Order.shipping  #発送済み
  @outStocks = Order.outStock  #在庫切れ商品
  @endSales = Order.endSale    #終売商品
end



private
#パラメーター個別
  def order_parameter
     params.require(:order).permit(:oder_number)
  end 

#パラメーター一週間
def week_parameter
  params.permit(orders:[:oder_number])[:orders]
end 

#パラメーター申請
def request_parameter
  params.permit(requests: [:status])[:requests]
end

#indexページ(pc,phone)
def index_page
  order_week_model
  @week = order_week
  @items = Item.paginate(page: params[:page], per_page: 3).order('id asc')
end  
  
end
