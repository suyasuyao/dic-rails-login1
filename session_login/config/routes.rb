Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
end
