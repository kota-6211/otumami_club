Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get "admin" => "admin#top"
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :mypage
        get :unsubscribe
        patch :withdraw
        get :saved_recipes
      end
    end
    resources :recipes, only: [:index, :edit, :update, :show, :destroy] do
         collection do
            get 'search'
          end
    end
  end

  resources :users, only: [:show, :edit, :update] do
    # mypageは登録情報 showはサイト内のプロフィール
    collection do
      get :mypage
      get :unsubscribe
      patch :withdraw
      get :saved_recipes
    end
  end

  resources :alcohol_genres, only: [:index, :create, :show, :edit, :uodate, :destroy]

  resources :chats, only: [:index, :create, :show, :destroy]

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
