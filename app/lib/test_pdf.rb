class TestPdf < Prawn::Document
    def initialize(id)
      super()
      ## 日本語フォントを使用しないと日本語使えません
    font_families.update('Test' => { normal: 'vendor/fonts/ipaexm.ttf', bold: 'vendor/fonts/ipaexm.ttf' })
    font 'Test'

    orders = Order.where(order_day: Date.parse(id),status: 1).order('id asc')

    rows = [
      ["#{Date.parse(id).to_s(:date_month)}の発注依頼"],
    ]

    table rows, cell_style: { height: 30, width: 500, padding: 0 } do
     
      # 文字サイズ
      cells.size = 25
      # 1行目はセンター寄せ
      row(0).align = :center
      # 1行目の背景色をff7500に
      row(0).background_color = 'c0c0c0'
      columns(0).width = 500
      
    end
     # 下に20
     move_down 50


    # テーブルの要素は2次元配列で定義する
    
    # 複雑なテーブルの表示
    rows = [
      ['日付','商品', '注文数'],
    ]

    table rows, cell_style: { height: 30, width: 500, padding: 0 } do
     
      # 文字サイズ
      cells.size = 20
      # 1行目はセンター寄せ
      row(0).align = :center
      # 1行目の背景色をff7500に
      row(0).background_color = 'ff7500'
      # 1列目の横幅を30に
      columns(0).width = 50
      columns(1).width = 400
      columns(2).width = 50
      # 行列の枠は四方固める
      columns(-1).row(-1).borders = %i[top bottom left right]
      
    end

    orders.each do |order|
      rows = [
        [order.order_day.to_s(:date_month),order.item.name, order.oder_number],
      ] 
      table rows, cell_style: { height: 20, width: 500, padding: 0 } do
     
        # 文字サイズ
        cells.size = 16
        # 1行目はセンター寄せ
        row(0).align = :center
        columns(0).width = 50
        columns(1).width = 400
        columns(2).width = 50
        # 行列の枠は四方固める
        columns(-1).row(-1).borders = %i[top bottom left right]
        
      end
    end  


  end 

  end
  