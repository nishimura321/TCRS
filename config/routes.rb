Rails.application.routes.draw do

  namespace :customer do
    get 'relationships/index'
  end
  namespace :customer do
    get 'families/new'
    get 'families/edit'
  end
  namespace :customer do
    get 'children/new'
    get 'children/edit'
  end
  namespace :customer do
    get 'reservations/new'
    get 'reservations/confirm'
    get 'reservations/thanks'
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/confirm_allergy'
    get 'reservations/edit'
  end
  namespace :customer do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :customer do
    get 'facilities/index'
    get 'facilities/show'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm_withdrawal'
  end
  namespace :customer do
    get 'menus/index'
  end
  namespace :facility do
    get 'menus/new'
    get 'menus/index'
    get 'menus/edit'
  end
  namespace :facility do
    get 'customers/show'
  end
  namespace :facility do
    get 'facilities/show'
    get 'facilities/edit'
  end
  namespace :facility do
    get 'reservation_conditions/new'
  end
  namespace :facility do
    get 'homes/top'
  end
  namespace :facility do
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/edit'
    get 'reservations/situation'
  end
  namespace :admin do
    get 'facilities/new'
    get 'facilities/index'
    get 'facilities/show'
    get 'facilities/edit'
    get 'facilities/situation'
  end
  namespace :admin do
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  # 施設用
  # URL /facility/sign_in ...
  devise_for :facility, skip: [:registrations, :passwords], controllers: {
  sessions: 'facility/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
