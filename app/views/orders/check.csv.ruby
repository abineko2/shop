require 'csv'

CSV.generate do |csv|
  column_names = %w(商品名 日付 発注数)
  csv << column_names
  @orders.each do |order|
    column_values = [
      order.item.name,
      order.order_day,
      order.oder_number
    ]
    csv << column_values
  end   
end