class MoneysController < ApplicationController
  def index
  end

  def show
  end

  #売り上げ管理表
  def uriage
    if params[:first_day]
      @first_day = Date.parse(params[:first_day])
    else
      @first_day = Date.today.beginning_of_month
    end  
    @last_day = @first_day.end_of_month
    
    (@first_day..@last_day).each do |day|
      unless Money.all.any?{|money| money.t_day == day}
        record = Money.new(t_day: day)
        record.save
      end
    end 
    @first_money = Money.find_by(t_day: @first_day)
    @dates = dates 
  end
#予算入力ページ
  def writeBudget
    @first_day = Date.parse(params[:date])
    @last_day = @first_day.end_of_month
    @dates = dates 
  end
#入力処理
  def input
    @first_day = Date.parse(params[:first_day])
    money_parameter.each do |id, item|
      money = Money.find id
      money.update_attributes(item)
    end  
    redirect_to uriage_moneys_url(params:{first_day: params[:first_day]})
  end

  def sends
    item = Item.find_by(jan: params[:jan])
    render json: item
  end

private
   def money_parameter
     params.permit(moneys:[:yosan, :noto])[:moneys]
   end
     
end
