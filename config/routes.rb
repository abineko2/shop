Rails.application.routes.draw do
  
  root "sessions#new"                          #topページ
  get 'login',to:'sessions#new'                #ログインページss
  post 'login',to:'sessions#create'            #ログイン処理
  delete 'logout',to: 'sessions#destroy'       #ログアウト処理


#money ルーティング    
  resources :moneys do
    collection do
      get 'uriage'                             #売り上げ管理表
      get 'uriagePhone'                        #売り上げ管理表phone
      patch 'input'                            
      get 'calc'                               #会計処理ページ
      get 'calc2'                              #会計処理ページスマホ
      get 'clear'                              #会計清算モーダル"
      get 'buyerTop'
    end 
    member do
      get 'memo'                               #phone版備考モーダル 
    end    
  end  
  post 'getMoney/:money',to:'moneys#getMoney'              #ajaxデータ格納
  get 'sends/:jan',to:"moneys#sends", as: :send_ajax       #ajax itemデータ受信
  get 'writeBudget/:date',to:"moneys#writeBudget",as: :writeBudget_money
  
#item ルーティング  
  resources :items do
    member do
      get 'deleteModal'
     
    end
    collection do
      patch 'stock'
      get 'phone'                            #=>モバイル版商品管理ページ
      get 'itemStock'                        #=>モバイル版在庫管理ページ
    end    
  end 

#order ルーティング  


 resources :orders do
  member do
    
    get 'modal'                               #注文際モーダル
    get 'one_week'                            #注文一週間モーダル
    get 'one_week2'                           #注文一週間モーダルスマホ
    patch 'orderOne'                          #注文
  end  
  collection do 
    get 'index2'                              #注文ページスマホ
    patch 'orderWeek'                         #注文一週間
    get 'check'                               #注文確認
    patch 'requests'                          #申請処理(買い付け)
    get 'requestConfirm'                      #処理確定ページ
  end     
 end 

end
