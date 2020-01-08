Rails.application.routes.draw do
  root "sessions#new"                          #topページ
  get 'login',to:'sessions#new'                #ログインページ
  post 'login',to:'sessions#create'            #ログイン処理
  delete 'logout',to: 'sessions#destroy'       #ログアウト処理


#money ルーティング    
  resources :moneys do
    collection do
      get 'uriage'
      patch 'input'
    end  
  end  
 
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
