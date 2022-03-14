Rails.application.routes.draw do
  # homes#topを初期画面にする


  devise_for :users

  # ログイン不要画面のhome（初期画面）,aboutのページ作成
  root 'homes#top'
  # as: "top"
  # get "homes/about"
  get "/home/about" => "homes#about"
  resources :users, only: [ :show, :index, :edit, :update, :create]
  resources :books, only: [ :show, :index, :edit, :update, :create, :destroy]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
