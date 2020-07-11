Rails.application.routes.draw do
  devise_for :shops
  #get 'shops/index'
  root "shops#index"
  resources :shops 
  resources :items, only: [:new, :create] do
    resources :messages, only:[:index, :create]
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end




