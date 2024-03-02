Rails.application.routes.draw do

  # device顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  #ゲストログイン用
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customer/sessions#guest_sign_in'
  end

  # device施設用
  # URL /facility/sign_in ...
  devise_for :facility, skip: [:registrations, :passwords], controllers: {
  sessions: 'facility/sessions'
  }

  # device管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #顧客用
  scope module: :customer do
    root to: "homes#top"
    get '/about' => 'homes#about'
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm_withdrawal' => 'customers#confirm_withdrawal'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :children, only: [:new, :create, :edit, :update]
    patch 'children/disable_child/:id' => 'children#disable_child', as: 'disable_child'
    resources :families, only: [:new, :create, :edit, :update]
    patch 'families/disable_family/:id' => 'families#disable_family', as: 'disable_family'
    get 'reservations/thanks' => 'reservations#thanks'
    resources :reservations, only: [:new, :create, :index, :show, :edit, :update]
    post 'reservations/confirm' => 'reservations#confirm'
    get 'reservations/confirm_allergy' => 'reservations#confirm_allergy'
    patch 'reservations/cancel/:id' => 'reservations#cancel', as: 'reservations_cancel'
    resources :relationships, only: [:create, :index, :destroy]
    resources :facilities, only: [:index, :show]
    get '/search' => 'searches#search'
    resources :menus, only: [:index]
  end

  #施設用
  namespace :facility do
    get '/' => 'homes#top', as: 'top'
    resources :reservations, only: [:index, :show, :edit, :update]
    get 'reservations/situation' => 'reservations#situation'
    patch 'reservations/cancel/:id' => 'reservations#cancel', as: 'reservations_cancel'
    resources :reservation_conditions, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :facilities, only: [:show, :edit, :update]
    resources :customers, only: [:show, :create]
    get '/search' => 'searches#search'
    resources :menus, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  #管理者用
  namespace :admin do
    resources :reservations, only: [:index, :show]
    resources :customers, only: [:index, :show]
    resources :facilities, only: [:new, :create, :index, :show, :edit, :update]
    patch 'facilities/withdrawal/:id' => 'facilities#withdrawal', as: 'facility_withdrawal'
    get 'facilities/situation' => 'facilities#situation'
    get '/search' => 'searches#search'
  end

end