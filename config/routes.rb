Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # 管理者用の管理ページのリンク一覧ページ
  get 'users/admin_top' => 'users#admin_top'
  resources :users, only: [:index, :show, :edit, :update] do
    # mypageは登録情報 showはサイト内のプロフィール
    get :mypage
    get :unsubscribe
    patch :withdraw
    get :saved_recipes
  end

  resources :alcohol_genres, only: [:index, :create, :show, :edit, :uodate, :destroy]

  resources :chats, only: [:index, :create, :show]

  scope module: :users do
    resources :recipes do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :saved_recipes, only: [:create, :destroy]
         collection do
            get 'search'
          end
    end
    resources :tags, only: %w(index show)
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
