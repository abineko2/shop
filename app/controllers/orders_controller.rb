class OrdersController < ApplicationController
#発注topページ

  def index
    order_week_model
    @week = order_week
    @items = Item.all.order('id asc')
  end

  #モーダル

  def modal
    @order = Order.find(params[:id])
    
  end

  #個別発注処理

  def orderOne
    @order = Order.find(params[:id])
    if @order.update_attributes(order_parameter)
      if @order.oder_number > 0
        @order.update_attributes(status: "申請中")
      end  
      flash[:success] = "入力しました。"
    else
      flash[:danger] = "失敗しました。"  
    end  
    redirect_to orders_path
  end

private
  def order_parameter
     params.require(:order).permit(:oder_number)
  end  
  
end
