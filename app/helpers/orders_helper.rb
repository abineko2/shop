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
    
end
