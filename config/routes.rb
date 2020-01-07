Rails.application.routes.draw do
  root "sessions#new"
  get 'login',to:'sessions#new'
  post 'login',to:'sessions#create'


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
