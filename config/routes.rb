Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  
  # 管理者用の管理ページのリンク一覧ページ
  get 'users/admin_top' => 'users#admin_top'
  resources :users, only: [:index, :show, :edit, :update] do
    # mypageは登録情報 showはサイト内のプロフィール
    get :mypage
    get :unsubscribe
    patch :withdraw
  end
  
  resources :alcohol_genres, only: [:index, :create, :show, :edit, :uodate, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
