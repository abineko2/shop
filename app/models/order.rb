class Order < ApplicationRecord
    belongs_to :item
    first,last = self.new.week()

    enum status:{
        "": 0,
        申請中: 1,
        発送済み: 2,
        在庫切れ: 3,
        終売: 4
    }
    scope :requests, -> { where('order_day>=? and order_day<=?',first,last).where(status:1).order('order_day asc')} #申請中
    scope :shipping, -> { where('order_day>=? and order_day<=?',first,last).where(status:2).order('order_day asc')} # 発送済み
    scope :outStock, -> { where('order_day>=? and order_day<=?',first,last).where(status:3).order('order_day asc')} #在庫切れ
    scope :endSale, -> {where('order_day>=? and order_day<=?',first,last).where(status:4).order('order_day asc')}
end
