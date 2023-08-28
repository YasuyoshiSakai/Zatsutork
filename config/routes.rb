Rails.application.routes.draw do

  # 管理者用デバイスルート
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'

<<<<<<< HEAD
    resources :genres, only: [:new, :index, :create, :edit, :update]
    resources :customers, only: [:index, :edit, :update, :destroy]
    resources :words, only: [:index, :show, :edit]
=======
    resources :genres, only: [:new, :index, :create, :edit, :update, :destroy]
    resources :customers, only: [:index, :edit, :show, :update, :destroy]
    resources :words, only: [:index, :show, :edit, :update, :destroy]
    resources :word_comments, only: [:destroy]
>>>>>>> develop
    get 'admin/search' => 'searchs#search', as: 'search'
  end

  # 顧客用デバイスルート
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 顧客用のルーティング
  root to: 'public/homes#top'
  scope module: :public do
    get "/homes/about" => "homes#about", as: "about"

    resources :words, only: [:index, :new, :create, :show] do
      resources :likes, module: :words, only: [:create, :destroy]
      resources :word_comments, only: [:create, :destroy]
    end
    resources :genres, only: [:new, :create]
    get 'random_word', to: 'words#random', as: 'random_word'
    get 'need', to: 'customers#need'
    get 'view_ranking', to: 'words#view_ranking'
    get 'like_ranking', to: 'words#like_ranking', as: 'like_ranking'
    resources :customers, only: [:show]
    get 'complete', to: 'words#complete'
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information/update' => 'customers#update'
    get 'customers/check' => 'customers#check', as: 'customers_check'
    get 'customers/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
  end
end
