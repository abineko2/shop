Rails.application.routes.draw do
  resources :moneys do
    collection do
      get 'uriage'
    end  
  end  
  root "moneys#index"
end
