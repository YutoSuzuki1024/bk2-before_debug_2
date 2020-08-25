Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  	resource :relationships, only: [:create, :destroy]
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'
  get 'followers/:id' => 'users#follower_index', as: 'follower'
  get 'followeds/:id' => 'users#followed_index', as: 'followed'
end