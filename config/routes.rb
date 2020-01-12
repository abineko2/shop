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
      get 'clear'                              #会計清算モーダル"
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
end
