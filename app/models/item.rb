class Item < ApplicationRecord
  has_many :orders, dependent: :destroy

#降順担保
scope :recent, -> { order(id: :desc) }

 #利益率計算
  def itemRate
    baika = self.baika.to_f
    genka = self.genka.to_f
    return format("%2.f",((baika - genka)/baika * 100))
  end

  #在庫金額
   def stockMoney
     stock = self.stock
     genka = self.genka
     return stock * genka   
   end

  #各商品の注文日付
   def item_order_day
     first = Date.today
     last = first+6
     return self.orders.where('order_day>=? and order_day<=?',first,last).order('id asc')
   end
    

      
end
