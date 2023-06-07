Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  
  # mypageは登録情報 showはサイト内のプロフィール
  resources :users, only: [:index, :show, :edit, :update] do
    get :mypage
    get :unsubscribe
    patch :withdraw
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
