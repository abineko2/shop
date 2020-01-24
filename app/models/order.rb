class Order < ApplicationRecord
    belongs_to :item
    enum status:{
        "": 0,
        申請中: 1,
        発送済み: 2,
        在庫切れ: 3,
        終売: 4
    }
end
