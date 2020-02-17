class Money < ApplicationRecord
  
  #降順担保
  scope :recent, -> { order(id: :desc) }
  
  #予算と売り上げの差額  
    def sagaku
      if self.uriage.present? && self.yosan.present?
        return  self.uriage.to_i - self.yosan.to_i 
      end  
    end    

  #月の判別(現在月か否か?)
   def monthCheck
      t_month = Date.today
      thisMonth = self.t_day
      if (thisMonth.month >= t_month.month) &&   (thisMonth.year >= t_month.year)
        return true
      else  
        return false
      end
   end   

  #売り上げ範囲内の合計
    def uriageTotal(firstDay,lastDay)
        total = 0
        (firstDay.. lastDay).each do |day|
            money = Money.find_by(t_day: day)
            total += money.uriage.to_i
        end   
      return total
    end

    #予算範囲内の合計
    def yosanTotal(firstDay,lastDay)
        total = 0
        (firstDay.. lastDay).each do |day|
            money = Money.find_by(t_day: day)
            total += money.yosan.to_i
        end   
      return total
    end
    #現在実績(%)
    def resParsent
      if self.yosan.present?
        yosan = self.yosan.to_f
      else
        yosan = 0
      end 
      if self.uriage.present?
        uriage = self.uriage.to_f
      else
        uriage = 0
      end         
      per = uriage / yosan
      return format("%.1f",per*100)
    end
    
    
end
