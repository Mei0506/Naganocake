Rails.application.routes.draw do
  
#顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root to: "public/homes#top"
get 'about', to: 'public/homes#about', as: :about

namespace :customers do
 get 'mypage' => 'public/custmers#show'
 get 'infomation/edit' => 'public/custmers#edit'
 get 'confirm/withdraw' => 'public/custmers#withdraw'
end



#管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
get 'admin', to: 'admin/homes#top', as: :admin

namespace :admin do
 resources :customers, only: [:index, :edit, :update, :show]
 resources :items, only: [:show, :index, :new, :create, :edit, :update]
 resources :orders, only: [:index, :show, :update]
 resources :order_details, only: [:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
