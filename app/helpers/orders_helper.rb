module OrdersHelper

    def order_week_model  #一週間record作成
      first = Date.today
      last = first + 6
      (first..last).each do |day|
        Item.all.each do |item|
           unless item.orders.any?{|order| order.order_day == day}
              record = item.orders.build(order_day: day)
              record.save
           end 
        end     
      end  
    end
#発注日
    def order_week
      first = Date.today
      last = first + 6
      array = []
      (first..last).each do |day|
        array << day
      end  
      return array
    end
#申請日
    def requestDay(day)    
      @days = Order.where(status: 1,order_day: day).order('order_day asc')
    end  

#一週間分発送済み商品
    #def shipping_order
      #first_day = Date.today
      #last_day = first_day+6
      #@shipping = Order.where("order_day >=? and order_day<=?", first_day,last_day).where(status:2).order('order_day asc')
    #end 

#期限切れ処理   
  def day_reset
    orders = Order.where('order_day < ?',Date.today)
    orders.each do |order|
      order.status = 0
      order.save
    end  
  end 
#スマホ版アイテム数検索
    def phoneOrderNum(item,day)
      @number = item.orders.find_by(order_day: day).oder_number     
    end 
#スマホ版日付,アイテムからorderインスタンス取得
    def day_instance(item, day)
      @order = item.orders.find_by(order_day: day)
    end          
end
