Rails.application.routes.draw do
  resources :moneys do
    collection do
      get 'uriage'
      patch 'input'
    end  
  end  
  root "moneys#index"
  get 'writeBudget/:date',to:"moneys#writeBudget",as: :writeBudget_money
end
