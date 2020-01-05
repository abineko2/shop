class Item < ApplicationRecord

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
   

      
end
