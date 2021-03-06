Rails.application.routes.draw do
  devise_for :shops
  root "shops#index"
  resources :shops 
  resources :items, only: [:new, :index, :create] do
    resources :messages
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end




