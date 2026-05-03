Rails.application.routes.draw do
  get "tasks/index"
  root "tasks#index"

  resources :tasks, only: [ :index, :create, :destroy ] do
    member do
      get :timer      # タイマー画面
      patch :complete # 完了処理
      get :history # 完了履歴
    end
  end
end
