class MoneysController < ApplicationController
  before_action :admin_block,only:[:index]
  before_action :buyer_block,only:[:buyerTop]

  def index
  end

  def show
  end
#買付係トップ
  def buyerTop
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
#json送信
  def sends
    item = Item.find_by(jan: params[:jan])
    render json: item
  end
#json受信

  def getMoney
   params.values.each do |item|
     if item["name"]  #在庫計算
       obj = Item.find_by(name: item["name"])
       num = obj.stock.to_i - item["number"].to_i
       obj.stock = num
       obj.save
     end 
   end
   if params["money"]
     money = Money.find_by(t_day: Date.today)
     num = money.uriage.to_i
     if num.nil?
      num = 0
     end
     num += params["money"].to_i
     money.uriage = num
     money.save
   end   
  end
  
private
   def money_parameter
     params.permit(moneys:[:yosan, :noto])[:moneys]
   end
  #管理者意外のアクセス禁止
   def admin_block
     if !logged_in?
       redirect_to root_url
     elsif current_user.buyer
       redirect_to buyerTop_moneys_url
     end  
   end  
  #買付意外のアクセス禁止
  def buyer_block
    if !logged_in?
      redirect_to root_url
    elsif !current_user.buyer
      redirect_to moneys_url
    end  
  end  



end
