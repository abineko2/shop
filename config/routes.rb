Rails.application.routes.draw do
#money ルーティング    
  resources :moneys do
    collection do
      get 'uriage'
      patch 'input'
    end  
  end  
  root "moneys#index"
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
