class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :order_day
      t.integer :oder_number,default:0
      t.integer :status,default: 0
      t.references :item

      t.timestamps
    end
  end
end
