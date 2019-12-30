class MoneysController < ApplicationController
  def index
  end

  def show
  end

  #売り上げ管理表
  def uriage
    @first_day = Date.today.beginning_of_month
    @last_day = @first_day.end_of_month
    (@first_day..@last_day).each do |day|
      unless Money.all.any?{|money| money.t_day == day}
        record = Money.new(t_day: day)
        record.save
      end
    end 
    @dates = dates 
  end
  
end
