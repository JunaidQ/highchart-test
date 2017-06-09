Rails.application.routes.draw do
  get 'chart/index'

  get 'eth', to: "chart#ethereum"
  get 'bitcoin', to: "chart#bitcoin"

  root to: 'chart#index'
  
end
