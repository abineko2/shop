Rails.application.routes.draw do
  
  root "sessions#new"                          #topページ
  get 'login',to:'sessions#new'                #ログインページ
  post 'login',to:'sessions#create'            #ログイン処理
  delete 'logout',to: 'sessions#destroy'       #ログアウト処理


#money ルーティング    
  resources :moneys do
    collection do
      get 'uriage'                             #売り上げ管理表
      patch 'input'                            
      get 'calc'                               #会計処理ページ
      get 'calc2'                              #会計処理ページスマホ
      get 'clear'                              #会計清算モーダル"
      get 'buyerTop'
    end   
  end  
  post 'getMoney/:money',to:'moneys#getMoney'  #ajaxデータ格納
  get 'sends/:jan',to:"moneys#sends", as: :send_ajax       #ajax itemデータ受信
  get 'writeBudget/:date',to:"moneys#writeBudget",as: :writeBudget_money
  
#item ルーティング  
  resources :items do
    member do
      get 'deleteModal'
    end
    collection do
      patch 'stock'
    end    
  end 

#order ルーティング  


 resources :orders do
  member do
    
    get 'modal'     #注文際モーダル
    get 'one_week'  #注文一週間モーダル
    patch 'orderOne'  #注文
  end  
  collection do 
    get 'index2'      #注文ページスマホ
    patch 'orderWeek'  #注文一週間
    get 'check'      #注文確認
    patch 'requests'  #申請処理(買い付け)
    get 'requestConfirm'  #処理確定ページ
  end     
 end 

end
