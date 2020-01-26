class OrdersController < ApplicationController
#発注topページ

  def index
    order_week_model
    @week = order_week
    @items = Item.paginate(page: params[:page], per_page: 5).order('id asc')
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
        test_pdf = TestPdf.new
        send_data test_pdf.render,
          filename:    'test.pdf',
          type:        'application/pdf',
          disposition: 'inline' # 画面に表示
      end
    end
  end
  

def requests
  request_parameter.each do |id,item|
    order = Order.find id
    order.update_attributes(item)
  end  
  redirect_to root_path
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

  
  
end
