Rails.application.routes.draw do
  get 'charts', to: "charts#index"

  get 'eth', to: "charts#ethereum"
  get 'bit', to: "charts#bitcoin"

  root to: 'charts#index'
  
end
