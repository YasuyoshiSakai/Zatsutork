Rails.application.routes.draw do

  devise_for :users
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do

    root to: 'homes#top'

    resources :genres, only: [:index, :create, :edit, :update]
    # ジャンル（管理画面、データ登録、編集、データ更新）

    resources :customers, only: [:index, :show, :edit, :update]
    # 顧客（一覧、詳細、編集、情報の更新）

    resources :words, only: [:new, :create]
    get 'admin/search' => 'searchs#search', as: 'search'

  end



# 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to: 'public/homes#top'
  scope module: :public do

    get "/homes/about" => "homes#about", as: "about"

    resources :words, only: [:index, :new, :create,:show]

    get 'complete', to: 'words#complete'

    get 'customers/mypage' => 'customers#show'
    # 顧客のマイページ

    get 'customers//information/edit' => 'customers#edit'
    # 顧客の会員登録情報編集

    patch 'customers/information/update' => 'customers#update'
    # 顧客の登録情報更新

    get 'customers/check' => 'customers#check', as: 'customers_check'
    # 顧客の退会確認画面

    get 'customers/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
    # 顧客の退会処理(ステータスの更新)


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end