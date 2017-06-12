Rails.application.routes.draw do
  get 'chart/index'

  get 'eth', to: "chart#ethereum"
  get 'bit', to: "chart#bitcoin"

  root to: 'chart#index'
  
end
