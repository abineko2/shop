module MoneysHelper
  def dates
      @moneys = Money.where('t_day >=?  and t_day <=?',@first_day,@last_day).order(t_day: "ASC")
  end

  
end
